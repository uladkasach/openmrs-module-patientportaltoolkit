/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.patientportaltoolkit.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.*;
import java.text.ParseException;

import org.openmrs.api.context.Context;
import org.openmrs.module.patientportaltoolkit.PatientPortalRelation;
import org.openmrs.module.patientportaltoolkit.api.PatientPortalRelationService;
import org.openmrs.module.patientportaltoolkit.SecurityLayer;
import org.openmrs.module.patientportaltoolkit.api.SecurityLayerService;

@Controller
public class EventDataController {

    @RequestMapping( value = "/patientportaltoolkit/getownrelationships/")
    @ResponseBody
    public Object getAllRemindersforPatient()
    {
        PatientPortalRelationService relationService = Context.getService(PatientPortalRelationService.class);
        List<PatientPortalRelation> relationships = relationService.getPatientPortalRelationByPerson(Context.getAuthenticatedUser().getPerson())
        return relationships;
    }

    @RequestMapping( value = "/patientportaltoolkit/getsecuritylayers/")
    @ResponseBody
    public Object getAllRemindersforPatient()
    {
        SecurityLayerService securityLayerService = Context.getService(SecurityLayerService.class);
        List<SecurityLayer> securityLayers = securityLayerService.getAllSecurityLayers();
        return securityLayers;
    }

    @RequestMapping( value = "/patientportaltoolkit/getrelationshiptypes/")
    @ResponseBody
    public Object getAllRemindersforPatient()
    {
        return Context.getPersonService().getAllRelationshipTypes());
    }
}
