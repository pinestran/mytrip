
<%@ page session="true" import="org.opencms.main.*, org.opencms.jsp.*,org.opencms.file.*, java.lang.String " %>
<%

    CmsJspActionElement cms = new CmsJspActionElement(pageContext,request,response);
    CmsObject cmsObject = OpenCms.initCmsObject(OpenCms.getDefaultUsers().getUserGuest());
//  CmsObject cmsObject = cms.getCmsObject();
    cmsObject.loginUser("Admin", "admin");

    session = request.getSession(false);
    if(session!=null){
        session.invalidate();
    }
    session = request.getSession(true);

    cmsObject.getRequestContext().setCurrentProject(cmsObject.readProject("Offline"));
    cmsObject.getRequestContext().setSiteRoot("/sites/default/");

    try{
        out.print("<br/>"+cmsObject.getRequestContext().getCurrentUser().getName());
        CmsUser user = cmsObject.createUser("John","123","Programmical Instructions", null);
    }catch(Exception ex){
        out.print("<br/>"+ex);
    }
%>