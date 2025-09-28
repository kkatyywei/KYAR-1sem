<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/catalog">
        <html>
            <head>
                <title>Каталог товаров</title>
                <link rel="stylesheet" type="text/css" href="zad1.css"/>
            </head>
            <body>
                <h1>Сортированный каталог товаров по цене</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Продукт</th>
                            <th>Бренд</th>
                            <th>Артикул</th>
                            <th>Цена</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="tovar/product">
                        <xsl:sort select="number(translate(/catalog/infa/opisanie[@id=concat('op', substring-after(@id, 'p'))]/prise, '$', ''))" data-type="number"  order="ascending"/>

                            <tr>
                                <td><xsl:value-of select="."/></td>
                                <td>
                                    <xsl:value-of select="/catalog/infa/opisanie[@id=concat('op', substring-after(current()/@id, 'p'))]/brand"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/catalog/infa/opisanie[@id=concat('op', substring-after(current()/@id, 'p'))]/articul"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/catalog/infa/opisanie[@id=concat('op', substring-after(current()/@id, 'p'))]/prise"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
