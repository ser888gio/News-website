<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xsi">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>{&#10;</xsl:text>
        <xsl:apply-templates select="data/article"/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="article">
        <xsl:text>"article_</xsl:text><xsl:value-of select="article_id"/><xsl:text>": {&#10;</xsl:text>
        <xsl:text>"article_id": "</xsl:text><xsl:value-of select="article_id"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"article_type": "</xsl:text><xsl:value-of select="@article_type"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"status": "</xsl:text><xsl:value-of select="@status"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"views": </xsl:text>
        <xsl:choose>
            <xsl:when test="@views">
                <xsl:value-of select="@views"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>null</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>,&#10;</xsl:text>
        <xsl:text>"likes": </xsl:text>
        <xsl:choose>
            <xsl:when test="@likes">
                <xsl:value-of select="@likes"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>null</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>,&#10;</xsl:text>
        <xsl:text>"title": "</xsl:text><xsl:value-of select="title"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"content_status": "</xsl:text><xsl:value-of select="content_status"/><xsl:text>",&#10;</xsl:text>
        <xsl:if test="podcast_link">
            <xsl:text>"podcast_link": "</xsl:text><xsl:value-of select="podcast_link"/><xsl:text>",&#10;</xsl:text>
        </xsl:if>
        <xsl:text>"language": "</xsl:text><xsl:value-of select="language"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"estimated_reading_time_in_minutes": </xsl:text><xsl:value-of select="estimated_reading_time_in_minutes"/><xsl:text>,&#10;</xsl:text>
        <xsl:text>"author": {&#10;</xsl:text>
        <xsl:text>"author_id": "</xsl:text><xsl:value-of select="author/@author_id"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"author_fullname": "</xsl:text><xsl:value-of select="author/author_fullname"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"author_username": "</xsl:text><xsl:value-of select="author/author_username"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"link_to_author_profile": "</xsl:text><xsl:value-of select="author/link_to_author_profile"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"author_bio": "</xsl:text><xsl:value-of select="author/author_bio"/><xsl:text>"&#10;</xsl:text>
        <xsl:text>},&#10;</xsl:text>
        <xsl:text>"abstract": "</xsl:text><xsl:value-of select="abstract"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"category": "</xsl:text><xsl:value-of select="category"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"perex": "</xsl:text><xsl:value-of select="perex"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"content": "</xsl:text><xsl:value-of select="content"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"create_date": "</xsl:text><xsl:value-of select="create_date"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"update_date": "</xsl:text><xsl:value-of select="update_date"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"citations": [&#10;</xsl:text>
        <xsl:apply-templates select="citations/citation"/>
        <xsl:text>],&#10;</xsl:text>
        <xsl:text>"tags": [&#10;</xsl:text>
        <xsl:apply-templates select="tags/tag"/>
        <xsl:text>],&#10;</xsl:text>
        <xsl:text>"contributors": {&#10;</xsl:text>
        <xsl:apply-templates select="contributors"/>
        <xsl:text>},&#10;</xsl:text>
        <xsl:text>"comments": [&#10;</xsl:text>
        <xsl:apply-templates select="comments/comment"/>
        <xsl:text>]&#10;</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>},&#10;</xsl:text>
        </xsl:if>
        <xsl:if test="position() = last()">
            <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="citation">
        <xsl:text>"</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="tag">
        <xsl:text>"</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="contributors">
        <xsl:for-each select="contributor">
            <xsl:text>"</xsl:text><xsl:value-of select="position()"/><xsl:text>":{"contributor_id": "</xsl:text>
                <xsl:value-of select="@contributor_id"/><xsl:text>","</xsl:text>
            <xsl:text>contributor_name": "</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"}</xsl:text>
            <xsl:choose>
                <xsl:when test="position() != last()"><xsl:text>,&#10;</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>&#10;</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="comment">
        <xsl:text>{&#10;</xsl:text>
        <xsl:text>"comment_author": "</xsl:text><xsl:value-of select="comment_author"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"comment_profile_link": "</xsl:text><xsl:value-of select="comment_profile_link"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"comment_content": "</xsl:text><xsl:value-of select="comment_content"/><xsl:text>",&#10;</xsl:text>
        <xsl:text>"comment_publish_date": "</xsl:text><xsl:value-of select="comment_publish_date"/><xsl:text>"&#10;</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
