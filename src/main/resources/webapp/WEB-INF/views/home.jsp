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
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<%@ include file="00-header.jsp"%>
<div class="container container-card">
	<div class="row card-deck" style="text-align: center;">
		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-primary mb-3 card-s">
			<a href="${ctxPath}/manager/chargepoints" class="anchor-deck"> <span
				class="anchor-p"><i>Nombre de points de charge</i></span><br> <span
				class="span-numeric">${stats.numChargeBoxes}</span>
			</a>
		</div>

		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-success mb-3 card-s">
			<a href="${ctxPath}/manager/ocppTags" class="anchor-deck"> <span
				class="anchor-p"><i>Nombre de Tags OCPP </i></span> <br> <span
				class="span-numeric">${stats.numOcppTags}</span>
			</a>
		</div>
		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-secondary mb-3 card-s">
			<a href="${ctxPath}/manager/users" class="anchor-deck"> <span
				class="anchor-p"><i>Nombre  d'utilisateurs</i></span><br> <span
				class="span-numeric">${stats.numUsers}</span>
			</a>
		</div>

		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-info mb-3 card-s">
			<a href="${ctxPath}/manager/reservations" class="anchor-deck"> <span
				class="anchor-p"><i>Nombre de demandes actives</i></span><br>
				<span class="span-numeric">${stats.numReservations}</span>
			</a>
		</div>
	</div>
	<!-- ROW 2-->
	<div class="row card-deck" style="text-align: center;">
		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-info mb-3 card-s">
			<a href="${ctxPath}/manager/transactions" class="anchor-deck"> <span
				class="anchor-p"><i>Nombre de transactions actives</i></span><br>
				<span class="span-numeric">${stats.numTransactions}</span>
			</a>
		</div>

		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-secondary mb-3 card-s">
			<a href="${ctxPath}/manager/home/ocppJsonStatus" class="anchor-deck">
				<span class="anchor-p"><i>Nombre de points de charge en ligne</i></span><br> <span style="line-height: 25px;"> <span>
						OCPP 1.2: ${stats.numOcpp12JChargeBoxes}</span><br> <span>
						OCPP 1.5: ${stats.numOcpp15JChargeBoxes}</span><br> <span>
						OCPP 1.6: ${stats.numOcpp16JChargeBoxes}</span><br>
			</span>
			</a>
		</div>

		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-success mb-3 card-s">
			<a href="${ctxPath}/manager/chargepoints" class="anchor-deck"> <span
				class="anchor-p"><i>Raccordement</i></span><br> <span
				style="line-height: 25px;"> <span> Aujourd'hui:
						${stats.heartbeatToday}</span><br> <span> Hier:
						${stats.heartbeatYesterday}</span><br> <span> Plus tôt:
						${stats.heartbeatEarlier}</span><br>
			</span>
			</a>
		</div>

		<div
			class="col-lg-4 col-md-12 col-sm-12 col-xs-12 card text-white bg-primary mb-3 card-s">
			<a href="${ctxPath}/manager/home/connectorStatus" class="anchor-deck">
				<span class="anchor-p"><i>Statut du connecteur</i></span><br> <span
				style="line-height: 25px;"> <c:forEach
						items="${stats.statusCountMap}" var="it">
						<span>${it.key} : ${it.value}</span>
						<br>
					</c:forEach>
			</span>
			</a>
		</div>
	</div>
</div>
<%@ include file="00-footer.jsp"%>