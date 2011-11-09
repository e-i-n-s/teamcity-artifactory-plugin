<%@ include file="/include.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="props" tagdir="/WEB-INF/tags/props" %>

<%--
  ~ Copyright (C) 2010 JFrog Ltd.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~ http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>

<jsp:useBean id="propertiesBean" scope="request" type="jetbrains.buildServer.controllers.BasePropertiesBean"/>
<c:set var="shouldDisplay" value="${param.shouldDisplay}" scope="request"/>

<c:set var="foundDeployArtifactsSelected"
       value="${(not empty propertiesBean.properties['org.jfrog.artifactory.selectedDeployableServer.deployArtifacts'])
       && (propertiesBean.properties['org.jfrog.artifactory.selectedDeployableServer.deployArtifacts'] == true) ? true : false}"/>

<c:if test="${shouldDisplay && foundDeployArtifactsSelected}">
    <div class="nestedParameter">
        Use Maven 2 compatible patterns: <props:displayValue
            name="org.jfrog.artifactory.selectedDeployableServer.useM2CompatiblePatterns" emptyValue="false"/>
    </div>

    <div class="nestedParameter">
        Ivy pattern: <props:displayValue
            name="org.jfrog.artifactory.selectedDeployableServer.ivyPattern" emptyValue="none specified"/>
    </div>
    <div class="nestedParameter">
        Artifact pattern: <props:displayValue
            name="org.jfrog.artifactory.selectedDeployableServer.artifactPattern"
            emptyValue="none specified"/>
    </div>
</c:if>