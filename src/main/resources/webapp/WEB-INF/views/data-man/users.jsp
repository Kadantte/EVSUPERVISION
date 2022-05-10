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
    });
</script>
<div class="content"><div>
    <section><span>Vue d&apos;ensemble de l&apos;utilisateur</span></section>
    <form:form action="${ctxPath}/manager/users/query" method="get" modelAttribute="params">
        <table class="userInput">
            <tr>
                <td>ID Utilisateur:</td>
                <td><form:input path="userPk"/></td>
            </tr>
            <tr>
                <td>ID Tag Ocpp:</td>
                <td><form:input path="ocppIdTag"/></td>
            </tr>
            <tr>
                <td>Nom:</td>
                <td><form:input path="name"/></td>
            </tr>
            <tr>
                <td>Adresse &#233;lectronique:</td>
                <td><form:input path="email"/></td>
            </tr>
            <tr>
                <td></td>
                <td id="add_space">
                    <input type="submit" value="Get">
                </td>
            </tr>
        </table>
    </form:form>
    <br>
    <table class="res action">
        <thead>
            <tr>
                <th data-sort="int">ID Utilisateur</th>
                <th data-sort="string">ID Tag Ocpp</th>
                <th data-sort="string">Nom</th>
                <th data-sort="string">T&#233;l&#233;phone</th>
                <th data-sort="string">Adresse &#233;lectronique</th>
                <th>
                    <form:form action="${ctxPath}/manager/users/add" method="get">
                        <input type="submit" class="blueSubmit" value="Ajouter Nouveau">
                    </form:form>
                </th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="cr">
            <tr><td><a href="${ctxPath}/manager/users/details/${cr.userPk}">${cr.userPk}</a></td>
                <td>
                    <c:if test="${not empty cr.ocppIdTag}">
                        <a href="${ctxPath}/manager/ocppTags/details/${cr.ocppTagPk}">${cr.ocppIdTag}</a>
                    </c:if>
                </td>
                <td>${cr.name}</td>
                <td>${cr.phone}</td>
                <td>${cr.email}</td>
                <td>
                    <form:form action="${ctxPath}/manager/users/delete/${cr.userPk}">
                        <input type="submit" class="redSubmit" value="Supprimer">
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div></div>
<%@ include file="../00-footer.jsp" %>