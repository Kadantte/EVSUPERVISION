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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<table class="userInput">
	<thead><tr><th>Adresse</th><th></th></thead>
	<tr><td>Rue:</td><td><form:input path="address.street"/></td></tr>
	<tr><td>Num&#233;ro de la r&#233;sidence:</td><td><form:input path="address.houseNumber"/></td></tr>
	<tr><td>Zip code:</td><td><form:input path="address.zipCode"/></td></tr>
	<tr><td>Ville:</td><td><form:input path="address.city"/></td></tr>
	<tr><td>Pays:</td><td><form:select path="address.country" items="${countryCodes}"/></td></tr>
</table>