#-*- coding: utf-8 -*-
from resources.lib.gui.hoster import cHosterGui
from resources.lib.handler.hosterHandler import cHosterHandler
from resources.lib.gui.gui import cGui
from resources.lib.gui.guiElement import cGuiElement
from resources.lib.handler.inputParameterHandler import cInputParameterHandler
from resources.lib.handler.outputParameterHandler import cOutputParameterHandler
from resources.lib.handler.requestHandler import cRequestHandler
from resources.lib.config import cConfig
from resources.lib.parser import cParser

SITE_IDENTIFIER = 'topbestsite_com'
SITE_NAME = 'TopBestSite'
SITE_DESC = 'For Kannadigas from TopBestSite'

URL_MAIN = 'https://emailradhesh.github.io/topbestsite/'

MOVIE_NETS = ('http://', 'load')

def load():

    oGui = cGui()

    oOutputParameterHandler = cOutputParameterHandler()
    oOutputParameterHandler.addParameter('siteUrl', 'https://emailradhesh.github.io/topbestsite/')

    liste = []
    liste.append( ["Reality shows", URL_MAIN + 'reality-shows.html'] )
    liste.append( ["Reality shows completed", URL_MAIN + 'reality-shows-completed.html'] )    
    liste.append( ["Kannada Movies", URL_MAIN + 'kannada-movies.html'] )
    liste.append( ["Hindi Movies", URL_MAIN + 'hindi-movies.html'] )
    liste.append( ["Telugu Movies", URL_MAIN + 'telugu-movies.html'] )
    liste.append( ["Tamil Movies", URL_MAIN + 'tamil-movies.html'] )

    for sTitle,sUrl in liste:

        oOutputParameterHandler = cOutputParameterHandler()
        oOutputParameterHandler.addParameter('siteUrl', sUrl)
        oGui.addDir(SITE_IDENTIFIER, 'showMovies', sTitle, 'doc.png', oOutputParameterHandler)

    oGui.setEndOfDirectory()


def showMovies(sSearch = ''):
    oGui = cGui()
    oInputParameterHandler = cInputParameterHandler()
    sUrl = oInputParameterHandler.getValue('siteUrl')
    oRequestHandler = cRequestHandler(sUrl)
    sHtmlContent = oRequestHandler.request();
    sPattern = '<a href="(.+?)">(.+?)<\/a>'
    oParser = cParser()
    aResult = oParser.parse(sHtmlContent, sPattern)
    if (aResult[0] == True):
        total = len(aResult[1])
        dialog = cConfig().createDialog(SITE_NAME)
        for aEntry in aResult[1]:
            cConfig().updateDialog(dialog, total)
            if dialog.iscanceled():
                break

            sTitle = aEntry[1]
            oOutputParameterHandler = cOutputParameterHandler()
            oOutputParameterHandler.addParameter('siteUrl', str(aEntry[0]))
            oOutputParameterHandler.addParameter('sMovieTitle', str(sTitle))
            #oOutputParameterHandler.addParameter('sThumbnail', str(aEntry[2]))
            oGui.addMisc(SITE_IDENTIFIER, 'showHosters', sTitle, '', '', '', oOutputParameterHandler)

        cConfig().finishDialog(dialog)

        sNextPage = __checkForNextPage(sHtmlContent)
        if (sNextPage != False):
            oOutputParameterHandler = cOutputParameterHandler()
            oOutputParameterHandler.addParameter('siteUrl', sNextPage)
            oGui.addDir(SITE_IDENTIFIER, 'showMovies', '[COLOR teal]Next >>>[/COLOR]', 'next.png', oOutputParameterHandler)

    oGui.setEndOfDirectory()


def __checkForNextPage(sHtmlContent):
    sPattern = '<a target="_self" href="(.+?)">'
    oParser = cParser()
    aResult = oParser.parse(sHtmlContent, sPattern)
    if (aResult[0] == True):
        nextPage = aResult[1][0]    
        if not nextPage.lower().startswith("http"):
        	nextPage = URL_MAIN + nextPage        
        #return aResult[1][0]
        return nextPage

    return False


def showHosters():
    oGui = cGui()
    oInputParameterHandler = cInputParameterHandler()
    sUrl = oInputParameterHandler.getValue('siteUrl')
    #sMovieTitle = oInputParameterHandler.getValue('sMovieTitle')
    sMovieTitle = ''
    if (oInputParameterHandler.getValue('sMovieTitle') != False):
    	sMovieTitle = oInputParameterHandler.getValue('sMovieTitle')
    sThumbnail = oInputParameterHandler.getValue('sThumbnail')
    if not sUrl.lower().startswith("http"):
        sUrl = URL_MAIN + sUrl
    oRequestHandler = cRequestHandler(sUrl)
    sHtmlContent = oRequestHandler.request();
    sPattern = '<p>(.+?)</p><ifram.+?\ssrc="(.+?)"'
    oParser = cParser()
    aResult = oParser.parse(sHtmlContent, sPattern)
    if (aResult[0] == True):
        total = len(aResult[1])
        dialog = cConfig().createDialog(SITE_NAME)
        for aEntry in aResult[1]:
            cConfig().updateDialog(dialog, total)
            if dialog.iscanceled():
                break

            sHosterUrl = aEntry[1]
            sTitle = aEntry[0]
            oHoster = cHosterGui().checkHoster(sHosterUrl)
            if (oHoster != False):
                oHoster.setDisplayName(sTitle)
                oHoster.setFileName(sMovieTitle)
                cHosterGui().showHoster(oGui, oHoster, sHosterUrl, sThumbnail)

        cConfig().finishDialog(dialog)
        sNextPage = __checkForNextPage(sHtmlContent)
        if (sNextPage != False):
            oOutputParameterHandler = cOutputParameterHandler()
            oOutputParameterHandler.addParameter('siteUrl', sNextPage)
            oGui.addDir(SITE_IDENTIFIER, 'showHosters', '[COLOR teal]Next >>>[/COLOR]', 'next.png', oOutputParameterHandler)        
    oGui.setEndOfDirectory()
