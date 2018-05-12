package com.thongtv.service;

import java.util.List;

import org.opencms.file.CmsUser;

import com.thongtv.model.Result;

/***
 * 
 * @author thong.tv
 *
 */

public interface HomeService {
	
	/**
	 * login function.
	 * @return
	 */
	public Result login();

	/**
	 * get and save info user into database.
	 */
	public boolean saveInfoUserContact();
	
	/**
	 * send mail function.
	 */
	public boolean sendMail(String mailTo, String mailSubject, String mailContent);

	/**
     * get list users in opencms when out of system.
     * @return
     */
    public List<CmsUser> getOpenCmsUsers();
    
    /**
     * register user.
     * @return
     */
    public Result register();
    
}
