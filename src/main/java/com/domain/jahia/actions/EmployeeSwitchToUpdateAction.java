package com.domain.jahia.actions;

import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by fschapiro on 08/06/2015.
 */

public class EmployeeSwitchToUpdateAction extends Action {

    private static final transient Logger logger = LoggerFactory.getLogger(EmployeeSwitchToUpdateAction.class);

    public ActionResult doExecute(HttpServletRequest httpServletRequest, RenderContext renderContext,
                                  Resource resource, JCRSessionWrapper jcrSessionWrapper, Map<String, List<String>> parameters,
                                  URLResolver urlResolver) throws Exception {

        logger.info("Action EmployeeSwitchToUpdateAction entered");

        return ActionResult.OK;
    }

}
