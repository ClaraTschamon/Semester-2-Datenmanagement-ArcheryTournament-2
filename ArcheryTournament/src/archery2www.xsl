<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="/archery_tournament/@name"/></title>
			</head>
			<body>
				<h1 id ="top"><xsl:value-of select="/archery_tournament/description"/></h1>
				<h2>Table of Contents</h2>
				<ol>
					<li><a href="#disciplines">Disciplines</a></li>
					<li><a href="#divisions">Divisions</a></li>
					<li><a href="#part.countr">Participating Countries</a></li>
					<li><a href="#groups">Groups</a></li>
					<li><a href="#matches">Matches</a></li>
				</ol>
				
				<hr/>
				
				<h2><a name="disciplines">Disciplines</a></h2>
				<ul>
					<xsl:for-each select="/archery_tournament/discipline">
        				<li><xsl:value-of select="/."/></li>
        			</xsl:for-each>
        		</ul>
        		
        		<hr/>
        		
        		<h2><a name="divisions">Divisions</a></h2>
        		<ul>
        			<xsl:for-each select="/archery_tournament/division">
        				<li><xsl:value-of select="/."/></li>
        			</xsl:for-each>
        		</ul>
        		
        		<hr/>
        		
        		<h2><a name="part.countr">Participating Countries</a></h2>
        		<!-- jedes Country sollte nur einmal vorkommen in der Liste! siehe Notizen -->
        		<ul>
        			<xsl:for-each select="/archery_tournament/registration/participant/state">
        				<li><xsl:value-of select="/."/></li>
        			</xsl:for-each>
        		</ul>
        		
        		<hr/>
        		
        		<h2><a name="groups">Groups</a></h2>
        			<xsl:for-each select="/archery_tournament/group">
        				<xsl:for-each select="subgroup">
        					<h4><xsl:value-of select="@sub-id"/></h4>
        					<p xml:space="preserve">
        						<xsl:for-each select="member"> 
        						<xsl:value-of select="count(id(@participant-id))"/>  							
        							<!-- hier ist der Fehler -->
        							<xsl:value-of select="id(@participant-id)/lastname"/>
        							<xsl:value-of select="id(@participant-id)/firstname"/>
        						</xsl:for-each>
        					</p>
        				</xsl:for-each>
        			</xsl:for-each>
        		
        		<hr/>
        		
        		<h2><a name="matches">Matches</a></h2>
        		<p xml:space="preserve"> 
        			<xsl:for-each select="/archery_tournament/match//*">
        				Match: <xsl:value-of select="@match-id"/><br/>
        				<!-- Scorecard für jeden einzelnen Participant machen -->
        				<xsl:for-each-group select="participant-id"/>
        					<table border="0px" cellpadding="0px" cellspacing="0px">
        						<tr>
        							<th><strong>target#</strong></th>
        							<th><strong>score</strong></th>
        						</tr>
        						<tr>
        							<th><strong><xsl:value-of select="target/@target-id"/></strong></th>
        							<th><xsl:value-of select="score"/></th>
        						</tr>
        					</table>
        			</xsl:for-each>
        		</p>
        		
        		<p><a href="#top">back to top</a></p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>