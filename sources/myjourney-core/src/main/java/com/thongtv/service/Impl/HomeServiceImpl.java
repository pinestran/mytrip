package com.thongtv.service.Impl;

/***
 * class implement HomeService.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.mail.EmailException;
import org.opencms.db.CmsSqlManager;
import org.opencms.file.CmsObject;
import org.opencms.file.CmsUser;
import org.opencms.jsp.CmsJspActionElement;
import org.opencms.jsp.CmsJspLoginBean;
import org.opencms.mail.CmsSimpleMail;
import org.opencms.main.CmsException;
import org.opencms.main.CmsLog;
import org.opencms.main.OpenCms;
import org.opencms.security.CmsOrgUnitManager;

import com.thongtv.model.Constants;
import com.thongtv.model.Result;
import com.thongtv.model.User;
import com.thongtv.service.HomeService;

public class HomeServiceImpl implements HomeService {
	
	private static final Log LOG = CmsLog.getLog(HomeServiceImpl.class);
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CmsJspActionElement cms;
	private CmsObject cmsO;
	private CmsJspLoginBean bean;
	private CmsUser user;
	
	public HomeServiceImpl(){}
	
	public HomeServiceImpl(PageContext pageContext, HttpServletRequest req, HttpServletResponse res){
		this.cms = new CmsJspActionElement(pageContext, req, res);
		this.cmsO = cms.getCmsObject();
		this.request = req;
		this.response = res;
		this.bean = new CmsJspLoginBean(pageContext, req, res);
		this.user = cms.getRequestContext().getCurrentUser();
	}

	public Result login(){
		Result result = new Result(0, "Login fail");
		
		String email = request.getParameter(Constants.EMAIL);
		String pass = request.getParameter(Constants.PASSWORD);
		if(StringUtils.isBlank(email) || StringUtils.isBlank(pass)){
			return result;
		}
		bean.login(email, pass);
		if(bean.isLoggedIn()){
			return new Result(1, "Login success");
		}
		
		return result;
	}
	
	/**
	 * this funtion to get and save info of user into database, and  feedback 
	 */
	@Override
	public boolean saveInfoUserContact() {
		
		String lastName = request.getParameter(Constants.LAST_NAME);
		String firstName = request.getParameter(Constants.FIRST_NAME);
		String email = request.getParameter(Constants.EMAIL);
		String comment = request.getParameter(Constants.COMMENT);
		
		if(StringUtils.isBlank(lastName) 
				|| StringUtils.isBlank(firstName) 
				|| StringUtils.isBlank(email) 
				|| StringUtils.isBlank(comment)){
			return false;
		}
		//save data.
		
		String pass = RandomStringUtils.randomAlphanumeric(10);
		
		try {
			CmsUser newUser = cmsO.createUser(email, pass,comment, null);
			newUser.setLastname(lastName);
			newUser.setFirstname(firstName);
			newUser.setEmail(email);
			
			cmsO.writeUser(newUser);
			sendMail(email, "Response from MyTrip Webside", "Thanks for your concern to your services. <br>We are going to contact you as soon as possible.<br>Thanks and best regard");
			return true;
		} catch (CmsException e) {
			LOG.error("Error in saveInfoUserContact: {}",e);
		}
		
		return false;
	}
	
	public void getListUser(){
	
		PageContext context = cms.getJspContext();
		List<User> listUser = new ArrayList<>();
		
		List<CmsUser> lst = getOpenCmsUsers();
		for(CmsUser u : lst){
			String desString = getUserDescriptionByUserID(u.getId().toString());
			if(StringUtils.isNotEmpty(desString)){
				User us = new User(u.getFirstname() + " " + u.getLastname(), u.getEmail(), desString);
				listUser.add(us);
			}
		}
		context.setAttribute("LstUser", listUser);
	}
	
	/**
	 * send mail function.
	 */
	public boolean sendMail(String mailTo, String mailSubject, String mailContent){
		
		CmsSimpleMail mail = new CmsSimpleMail();
		try {
			mail.addTo(mailTo);
			mail.setSubject(mailSubject);
			mail.setContent(mailContent, "text/html; charset=utf-8");
			mail.send();
			
			return removeDescription(mailTo);
			
			
		} catch (EmailException e) {
			LOG.error("Error in sendMail function: {} ", e);
		}
		//remove description of user.
		
		
		return false;
	}
	
	private boolean removeDescription(String email){
		
		String userId = getUserIDByEmail(email);
		String query = "UPDATE CMS_USERDATA SET DATA_VALUE = ? WHERE DATA_KEY = ? AND USER_ID = ? ";
		//connect to database and set data.
		CmsSqlManager cmsSqlManager = OpenCms.getSqlManager();
		try {
			Connection connection = cmsSqlManager.getConnection(cmsSqlManager.getDefaultDbPoolName());
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, "");
			statement.setString(2, "USER_DESCRIPTION");
			statement.setString(3, userId);
			
			statement.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			LOG.error("Error in removeDescription: {}", e);
		}
		return false;
	}
	
	private String getUserDescriptionByUserID(String userID){
		
		String result = "";
		String query = "Select USER_DESCRIPTION FROM CMS_USERDATA WHERE USER_ID = ?";
		CmsSqlManager cmsSqlManager = OpenCms.getSqlManager();
		try {
			Connection connection = cmsSqlManager.getConnection(cmsSqlManager.getDefaultDbPoolName());
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, userID);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()){
				result = resultSet.getString("USER_DESCRIPTION");
			}
		} catch (SQLException e) {
			LOG.error("Error in getUserIDByEmail: {}", e);
		}
		
		return result;
	}
	
	private String getUserIDByEmail(String email){
		
		String result = "";
		String query = "Select USER_ID FROM CMS_USERS WHERE USER_EMAIL = ?";
		CmsSqlManager cmsSqlManager = OpenCms.getSqlManager();
		try {
			Connection connection = cmsSqlManager.getConnection(cmsSqlManager.getDefaultDbPoolName());
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()){
				result = resultSet.getString("USER_ID");
			}
		} catch (SQLException e) {
			LOG.error("Error in getUserIDByEmail: {}", e);
		}
		
		return result;
	}
	
	/**
     * get list users in opencms when out of system.
     * @return
     */
    @Override
    public List<CmsUser> getOpenCmsUsers(){
        
        List<CmsUser> users = null;
        try {
            /*login*/
            CmsObject cmsObject = OpenCms.initCmsObject(OpenCms.getDefaultUsers().getUserGuest());
            CmsOrgUnitManager oum = OpenCms.getOrgUnitManager();
            /*get user list in system*/
            users = oum.getUsers(cmsObject, cmsObject.getRequestContext().getOuFqn(), true);
        }catch(CmsException e){
            LOG.error("Error when get list users in getOpenCmsUsers function: {}", e);
        }
        return users;
    }

	@Override
	public Result register() {

		Result result = new Result(0,"Register Fail.");

		String lastName = request.getParameter(Constants.LAST_NAME);
		String firstName = request.getParameter(Constants.FIRST_NAME);
		String email = request.getParameter(Constants.EMAIL);
		String password = request.getParameter(Constants.PASSWORD);
		
		if(StringUtils.isBlank(lastName) 
				|| StringUtils.isBlank(firstName) 
				|| StringUtils.isBlank(email) 
				|| StringUtils.isBlank(password)){
			return result;
		}
		
		if(!bean.isLoggedIn()){
			bean.login("Admin", "admin");
			if(!bean.isLoginSuccess()){
				return result;
			}
		}
		
		try {
			CmsUser newUser = cmsO.createUser(email, password, "", null);
			newUser.setLastname(lastName);
			newUser.setFirstname(firstName);
			newUser.setEmail(email);
			
			cmsO.writeUser(newUser);
			sendMail(email, "New Account On MyTrip Webside", "Hi "+ lastName + " " + firstName
					+ "<br><br>Thanks for your concern to our services. <br>Your new Account is:<br>"
					+ "Email: "+ email + "<br>"
					+ "Password: "+ password +"<br>Keep this info in mind.^^<br><br> Thanks and best regard");
			return new Result(1, "Register Successed. Check your mail please.");
		} catch (CmsException e) {
			LOG.error("Error in saveInfoUserContact: {}",e);
		}
		
		return result;
	}
}











