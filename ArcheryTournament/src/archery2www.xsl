<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="/archery_tournament/@name"/></title>
				<style>
				* {font-family: sans-serif}
				</style>
			</head>
			<body>
				<h1 id ="top"><xsl:value-of select="/archery_tournament/description"/></h1>
				<h2>Table of Contents</h2>
				<ol>
					<li><a href="#disciplines">Disciplines</a></li>
					<li><a href="#divisions">Divisions</a></li>
					<li><a href="#part.countr">Participating Countries</a></li>
					<li><a href="#groups">Groups</a></li>
					<li><a href="#matches">Scorecards</a></li>
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
        		<!-- jedes Country sollte nur einmal vorkommen in der Liste!?? -->
        		<ul>
        			<xsl:for-each select="/archery_tournament/registration/participant/state">
        				<li><xsl:value-of select="/."/></li>
        			</xsl:for-each>
        		</ul>
        		
        		<!-- 
        		<ul> in oxygen würde es wahrscheinlich funktionieren
        			<xsl:for-each-group select="/archery_tournament/registration/participant/state" group-by=".">
        				<li><xsl:value-of select="."/></li>
        			</xsl:for-each-group>
        		</ul> -->
        		
        		<hr/>
        		
        		<h2><a name="groups">Groups</a></h2>
        			<xsl:for-each select="/archery_tournament/group">
        				<xsl:for-each select="subgroup">
        					<h4><xsl:value-of select="@sub-id"/></h4>
       							<xsl:for-each select="member"> 
       								<xsl:sort select="id(@participant-id)/lastname" order="ascending"/>		
       									<p xml:space="preserve">					
       										<xsl:value-of select="id(@participant-id)/lastname"/>
       										<xsl:value-of select="id(@participant-id)/firstname"/>
       										<br/>
       									</p>	
       							</xsl:for-each>
        				</xsl:for-each>
        			</xsl:for-each>
        		
        		<hr/>
        		
      	  		<h2><a name="scorecards">Scorecards</a></h2> 	
					<xsl:for-each select="//registration/participant">
      		  			<h4 xml:space="preserve">Scorecard of
	      	  				<xsl:value-of select="lastname"/>	
	     					<xsl:value-of select="firstname"/>
		     			 </h4>	
		     			 <xsl:variable name="participant-id" select="@id"/>
		     			 <table>
		     			 	<xsl:for-each select="//match">
		     			 		<tr>
		     			 			<xsl:for-each select="target">
		     			 				<td><xsl:value-of select="score[@participant-id = $participant-id]"/></td>
		     			 			</xsl:for-each>
		     			 		</tr>
		     			 	</xsl:for-each>
		     			 </table>
		     		</xsl:for-each>				
 		
        		<br/>
      			<hr/>
        		<p><a href="#top">back to top</a></p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>