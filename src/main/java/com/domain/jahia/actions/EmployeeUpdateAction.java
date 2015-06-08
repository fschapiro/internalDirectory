package com.domain.jahia.actions;


import org.apache.commons.fileupload.disk.DiskFileItem;
import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.jahia.tools.files.FileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by fschapiro on 08/06/2015.
 */

public class EmployeeUpdateAction extends Action {

    private static final transient Logger logger = LoggerFactory.getLogger(EmployeeUpdateAction.class);

    public ActionResult doExecute(HttpServletRequest httpServletRequest, RenderContext renderContext,
                                  Resource resource, JCRSessionWrapper jcrSessionWrapper, Map<String, List<String>> parameters,
                                  URLResolver urlResolver) throws Exception {

        logger.info("Action EmployeeUpdateAction entered");

        String firstName = resource.getNode().getPropertyAsString("firstName");
        String lastName = resource.getNode().getPropertyAsString("lastName");

        logger.info("Employee " + firstName + " " + lastName + " start updating");

        String SelectedLocation = getParameter(parameters, "locationselection");

        resource.getNode().setProperty("location", SelectedLocation);

        String SelectedFixNumber = getParameter(parameters, "fixPhoneNumber");

        resource.getNode().setProperty("fixPhoneNumber", SelectedFixNumber);

        String SelectedMobileNumber = getParameter(parameters, "mobilePhoneNumber");

        resource.getNode().setProperty("mobilePhoneNumber", SelectedMobileNumber);

        String SelectedSkypeID = getParameter(parameters, "skypeID");

        resource.getNode().setProperty("skypeID", SelectedSkypeID);

        resource.getNode().setProperty("photo", inputFile);

        jcrSessionWrapper.save();

        logger.info("Employee " + firstName + " " + lastName + " update:");
        logger.info("location " + resource.getNode().getPropertyAsString("location"));
        logger.info("fixPhoneNumber " + resource.getNode().getPropertyAsString("fixPhoneNumber"));
        logger.info("mobilePhoneNumber " + resource.getNode().getPropertyAsString("mobilePhoneNumber"));
        logger.info("skypeID " + resource.getNode().getPropertyAsString("skypeID"));

        return ActionResult.OK;
    }

}
