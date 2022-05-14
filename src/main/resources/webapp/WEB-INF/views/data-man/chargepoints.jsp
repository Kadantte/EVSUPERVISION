<%--

    SteVe - SteckdosenVerwaltung - https://github.com/RWTH-i5-IDSG/steve
    Copyright (C) 2013-2022 RWTH Aachen University - Information Systems - Intelligent Distributed Systems Group (IDSG).
    All Rights Reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

--%>
<%@ include file="../00-header.jsp" %>
<script type="text/javascript">
    $(document).ready(function() {
        <%@ include file="../snippets/sortable.js" %>
        $("#unknown").click(function () {
            $("#unknownTable, #overview").slideToggle(250);
        });
    });
</script>
<div class="content">
    <div>
    <section><span id="unknown" style="cursor: pointer">
        Bornes de recharge inconnues
    <a class="tooltip" href="#"><img src="${ctxPath}/static/images/info.png" style="vertical-align:middle">
        <span>Une liste des bornes de recharge qui ont tent&eacute; de se connecter et d&apos;envoyer une notification de d&eacute;marrage mais qui n&apos;&eacute;taient pas pr&eacute;sentes dans la base de donn&eacute;es.</span>
    </a>
    </span></section>
    <div id="unknownTable" style="display: none">
        <table class="res add-margin-bottom">
            <thead>
            <tr>
                <th data-sort="string">ID de la Borne de recharge</th>
                <th data-sort="int"># de Tentatives</th>
                <th data-sort="date">Derni&eacute;re tentative</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${unknownList}" var="item">
                <tr>
                    <td>${item.key}</td>
                    <td>${item.numberOfAttempts}</td>
                    <td data-sort-value="${item.lastAttemptTimestamp.millis}">${item.lastAttemptTimestamp}</td>
                    <td>
                        <form:form cssClass="inline" action="${ctxPath}/manager/chargepoints/unknown/add/${item.key}/" method="post">
                            <input type="submit" class="blueSubmit" value="Add"/>
                        </form:form>
                        &nbsp;
                        <form:form cssClass="inline" action="${ctxPath}/manager/chargepoints/unknown/remove/${item.key}/" method="post">
                            <input type="submit" class="redSubmit" value="Forget"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <section><span>
    Aper&ccedil;u des bornes de recharge
    <a class="tooltip" href="#"><img src="${ctxPath}/static/images/info.png" style="vertical-align:middle">
        <span>La suppression d&apos;une borne de recharge entra&icirc;ne la perte de toutes les informations associ&eacute;es, y compris les transactions, les r&eacute;servations, l&apos;&eacute;tat du connecteur et les valeurs des compteurs du connecteur.</span>
    </a>
    </span></section>
    <div id="overview">
        <form:form action="${ctxPath}/manager/chargepoints/query" method="get" modelAttribute="params">
            <table class="userInput">
                <tr>
                    <td>ID de la Borne de recharge:</td>
                    <td><form:input path="chargeBoxId"/></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><form:input path="description"/></td>
                </tr>
                <tr>
                    <td>Version Ocpp:</td>
                    <td><form:select path="ocppVersion">
                        <option value="" selected>Tout</option>
                        <form:options items="${ocppVersion}" itemLabel="value"/>
                    </form:select>
                    </td>
                </tr>
                <tr>
                    <td>P&eacute;riode de branchement:</td>
                    <td><form:select path="heartbeatPeriod">
                        <form:options items="${heartbeatPeriod}" itemLabel="value"/>
                    </form:select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td id="add_space">
                        <input type="submit" value="Afficher">
                    </td>
                </tr>
            </table>
        </form:form>
        <br>
        <table class="res action">
            <thead>
            <tr>
                <th data-sort="string">ID de la Borne de recharge</th>
                <th data-sort="string">Description</th>
                <th data-sort="string">Protocole OCPP</th>
                <th data-sort="date">Dernier P&eacute;riode de branchement</th>
                <th>
                    <form:form action="${ctxPath}/manager/chargepoints/add" method="get">
                        <input type="submit" class="blueSubmit" value="Ajouter Nouveau">
                    </form:form>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cpList}" var="cp">
                <tr><td><a href="${ctxPath}/manager/chargepoints/details/${cp.chargeBoxPk}">${cp.chargeBoxId}</a></td>
                    <td>${cp.description}</td>
                    <td>${cp.ocppProtocol}</td>
                    <td data-sort-value="${cp.lastHeartbeatTimestampDT.millis}">${cp.lastHeartbeatTimestamp}</td>
                    <td>
                        <form:form action="${ctxPath}/manager/chargepoints/delete/${cp.chargeBoxPk}">
                            <input type="submit" class="redSubmit" value="Supprimer">
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div></div>
<%@ include file="../00-footer.jsp" %>