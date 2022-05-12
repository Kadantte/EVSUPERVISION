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
<%@ include file="00-header.jsp" %>
<div class="error">
    <h3>Erreur:</h3>
    <p>${exception}</p>
    <c:if test="${not empty exception.cause}">
        <h3>Raison:</h3>
        <p>${exception.cause}</p>
    </c:if>
    <br>
    <p>Vous pouvez <a href="javascript:window.history.back()">revenir en arrière</a> ou, pour plus de d&eacute;tails, <a href="${ctxPath}/manager/log">Voir le journal</a></p>
</div>
<%@ include file="00-footer.jsp" %>