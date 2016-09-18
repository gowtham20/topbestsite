#-*- coding: utf-8 -*-
#Venom.
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

URL_MAIN = 'https://raw.githubusercontent.com/emailradhesh/topbestsite/master/'

#MOVIE_NETS = ('http://www.topbestsite.com/kannada-movies', 'showMovies')

MOVIE_NETS = ('http://', 'load')
#NETS_NEWS =  ('http://www.topbestsite.com/reality-shows.html', 'showMovies')
#NETS_GENRES = (True, 'load')

#URL_SEARCH = ('http://www.notre-ecole.net/?s=', 'showMovies')
#FUNCTION_SEARCH = 'showMovies'

def load():

    oGui = cGui()

    oOutputParameterHandler = cOutputParameterHandler()
    oOutputParameterHandler.addParameter('siteUrl', 'http://venom/')
    #oGui.addDir(SITE_IDENTIFIER, 'showSearch', 'Search', 'search.png', oOutputParameterHandler)

    liste = []
    liste.append( ["Reality shows", URL_MAIN + 'reality-shows/index.html'] )
    liste.append( ["Kannada Movies", URL_MAIN + 'kannada-movies/index.html'] )
    liste.append( ["Hindi Movies", URL_MAIN + 'hindi-movies/index.html'] )
    liste.append( ["Telugu Movies", URL_MAIN + 'telugu-movies/index.html'] )
    liste.append( ["Tamil Movies", URL_MAIN + 'tamil-movies/index.html'] )
    liste.append( ["Misc", URL_MAIN + 'temp.html'] )
    for sTitle,sUrl in liste:

        oOutputParameterHandler = cOutputParameterHandler()
        oOutputParameterHandler.addParameter('siteUrl', sUrl)
        oGui.addDir(SITE_IDENTIFIER, 'showMovies', sTitle, 'doc.png', oOutputParameterHandler)

    oGui.setEndOfDirectory()

#def showSearch():
    #oGui = cGui()

    #sSearchText = oGui.showKeyBoard()
    #if (sSearchText != False):
            #sUrl = 'http://www.topbestsite.com'+sSearchText
            #showMovies(sUrl)
            #oGui.setEndOfDirectory()
            #return


def showMovies(sSearch = ''):
    oGui = cGui()
    #if sSearch:
      #sUrl = sSearch
    #else:
        #oInputParameterHandler = cInputParameterHandler()
        #sUrl = oInputParameterHandler.getValue('siteUrl')
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

    #if not sSearch:
        #oGui.setEndOfDirectory()
    oGui.setEndOfDirectory()

def __checkForNextPage(sHtmlContent):
    sPattern = '<a href="(.+?)"><i>'
    oParser = cParser()
    aResult = oParser.parse(sHtmlContent, sPattern)
    if (aResult[0] == True):
        return aResult[1][0]

    return False


def showHosters():
    oGui = cGui()
    oInputParameterHandler = cInputParameterHandler()
    sUrl = oInputParameterHandler.getValue('siteUrl')
    sMovieTitle = oInputParameterHandler.getValue('sMovieTitle')
    sThumbnail = oInputParameterHandler.getValue('sThumbnail')
    oRequestHandler = cRequestHandler(sUrl)
    sHtmlContent = oRequestHandler.request();
    sPattern = '<p>(.+?)</p><iframe\s.+?src="(.+?)"'       
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

    oGui.setEndOfDirectory()
