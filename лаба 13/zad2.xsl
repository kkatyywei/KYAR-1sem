<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/students">
        <html>
            <head>
                <title>Таблица аттестации студентов</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        padding: 10px;
                        border: 1px solid #ddd;
                        text-align: center;
                    }
                    .low-grade {
                        background-color: red;
                        color: white;
                    }
                    .high-grade {
                        background-color: green;
                        color: white;
                    }
                </style>
            </head>
            <body>
                <h2>Таблица аттестации студентов</h2>
                <table>
                    <tr>
                        <th>ФИО</th>
                        <th>Предмет</th>
                        <th>Оценка</th>
                    </tr>
                    <xsl:for-each select="student">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="subject"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="grade &lt; 4">
                                        <span class="low-grade"><xsl:value-of select="grade"/></span>
                                    </xsl:when>
                                    <xsl:when test="grade &gt; 8">
                                        <span class="high-grade"><xsl:value-of select="grade"/></span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="grade"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
