<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Roster with XSLT</title>
				<link rel="stylesheet" type="text/css" href="../styles.css" />
			</head>
			<body>
				<h1>Information Warfare Group Roster</h1>
				<table id="roster" class="center">
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Username</th>
						<th>Email</th>
						<th>Company</th>
					</tr>
					<xsl:for-each select="roster/member">
					<tr>
						<td><xsl:value-of select="fname"/></td>
						<td><xsl:value-of select="lname"/></td>
						<td><xsl:value-of select="@username"/></td>
						<td><xsl:value-of select="email"/></td>
						<td><xsl:value-of select="co"/></td>
					</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>