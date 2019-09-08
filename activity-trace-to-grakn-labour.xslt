<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xes="http://www.xes-standard.org">

<xsl:output method="text" encoding="utf-8"/>


<xsl:template match="xes:trace">
	<xsl:text>insert
		</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>&#xa;    </xsl:text>
</xsl:template>

<xsl:strip-space elements="*"/>

<xsl:template match="xes:event">
	<xsl:text>$</xsl:text><xsl:value-of select="generate-id(.)"/> 
	<xsl:text> isa activity-event, has event-name "</xsl:text> <xsl:if test="xes:string[@key='concept:name']">
		<xsl:value-of select="xes:string[@key='concept:name']/@value"/>
	</xsl:if>	
	<xsl:text>", has transition "</xsl:text><xsl:if test="xes:string[@key='lifecycle:transition']">
		<xsl:value-of select="xes:string[@key='lifecycle:transition']/@value"/>
	</xsl:if>
	<xsl:text>", has event-date </xsl:text><xsl:if test="xes:date[@key='time:timestamp']">
		<xsl:value-of select="substring-before(xes:date[@key='time:timestamp']/@value,'T')"/>
	</xsl:if>	
	<xsl:text>, has hours </xsl:text><xsl:if test="xes:date[@key='time:timestamp']">
		<xsl:value-of select="hours-from-dateTime(xes:date[@key='time:timestamp']/@value)"/>
	</xsl:if>
	<xsl:text>, has minutes </xsl:text><xsl:if test="xes:date[@key='time:timestamp']">
		<xsl:value-of select="minutes-from-dateTime(xes:date[@key='time:timestamp']/@value)"/>
	</xsl:if>			
	<xsl:text>, has trace-id </xsl:text><xsl:if test="../xes:string[@key='concept:name']">
		<xsl:value-of select="../xes:string[@key='concept:name']/@value"/>
	</xsl:if>
	<xsl:text>, has day-type "work-day", has person-id "hh104";
		</xsl:text>
</xsl:template>


</xsl:stylesheet>