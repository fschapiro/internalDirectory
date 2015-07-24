package com.domain.jahia.initializers;

import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.usermanager.JahiaUser;
import org.jahia.services.usermanager.JahiaUserManagerProvider;
import org.jahia.services.usermanager.JahiaUserManagerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class EmployeeInitializer implements ModuleChoiceListInitializer {

	/**
	 * Logger
	 */
	private static final Logger logger = LoggerFactory.getLogger(EmployeeInitializer.class);

	/**
	 * Key of the choicelist initializer (used to be called in a definitions.cnd file)
	 */
	private String key;

	/**
	 * Service used for retrieving users from the LDAP
	 */
	private transient JahiaUserManagerService jahiaUserManagerService;

	/**
	 * Provider from which to retrieve users
	 */
	private String providerUsed;

	public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param, List<ChoiceListValue> values,
													 Locale locale, Map<String, Object> context) {

		if (context == null) {
			return new ArrayList<ChoiceListValue>();
		}

		return getUserList();
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	/**
	 * Setter for the JahiaUserManagerService
	 * @param jahiaUserManagerService
	 */
	public void setJahiaUserManagerService(JahiaUserManagerService jahiaUserManagerService) {
		this.jahiaUserManagerService = jahiaUserManagerService;
	}

	/**
	 * Setter for the providerUsed
	 * @param providerUsed
	 */
	public void setProviderUsed(String providerUsed) {
		this.providerUsed = providerUsed;
	}

	private List<ChoiceListValue> getUserList() {
		// TODO remove this mockup code, and retrieve users directly from Jahia
		List<ChoiceListValue> myChoiceList = new ArrayList<ChoiceListValue>();

		JahiaUser jahiaUser = jahiaUserManagerService.lookupUser("Roger");
		logger.info("UUUID : " + jahiaUser.getProperty("jcr:uuid"));
		myChoiceList.add(new ChoiceListValue(jahiaUser.getName(), jahiaUser.getProperty("jcr:uuid")));


		//JahiaUserManagerProvider userManagerProvider = jahiaUserManagerService.getProvider(providerUsed);



		// The following commented code is a draft of a final code
		/*
		List<String> userList = jahiaUserManagerService.getUserList(providerUsed);

		for (String user : userList) {
			JahiaUser jahiaUser = jahiaUserManagerService.lookupUser(user);
			String userKey = jahiaUser.getUserKey();
			logger.info("User found : " + user + " / User key : " + jahiaUserManagerService.lookupUser(user).getUserKey
					());

			myChoiceList.add(new ChoiceListValue(jahiaUserManagerService.lookupUser(user).getUserKey(), user));
		}*/

		return myChoiceList;
	}
}

