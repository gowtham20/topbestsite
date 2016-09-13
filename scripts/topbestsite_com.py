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

URL_MAIN = 'http://www.topbestsite.com'

MOVIE_NETS = ('http://www.topbestsite.com/kannada-movies', 'showMovies')

MOVIE_NETS = ('http://', 'load')
NETS_NEWS =  ('http://www.topbestsite.com/reality-shows.html', 'showMovies')
NETS_GENRES = (True, 'load')

#URL_SEARCH = ('http://www.notre-ecole.net/?s=', 'showMovies')
#FUNCTION_SEARCH = 'showMovies'

def load():

    oGui = cGui()

    oOutputParameterHandler = cOutputParameterHandler()
    oOutputParameterHandler.addParameter('siteUrl', 'http://venom/')
    #oGui.addDir(SITE_IDENTIFIER, 'showSearch', 'Search', 'search.png', oOutputParameterHandler)

    liste = []
    liste.append( ["Reality shows","https://raw.githubusercontent.com/emailradhesh/topbestsite/master/reality-shows/index.html"] )
    liste.append( ["Kannada Movies","https://raw.githubusercontent.com/emailradhesh/topbestsite/master/kannada-movies/index.html"] )
    liste.append( ["Hindi Movies","https://raw.githubusercontent.com/emailradhesh/topbestsite/master/hindi-movies/index.html"] )
    liste.append( ["Telugu Movies","https://raw.githubusercontent.com/emailradhesh/topbestsite/master/telugu-movies/index.html"] )
    liste.append( ["Tamil Movies","https://raw.githubusercontent.com/emailradhesh/topbestsite/master/tamil-movies/index.html"] )

    for sTitle,sUrl in liste:

        oOutputParameterHandler = cOutputParameterHandler()
        oOutputParameterHandler.addParameter('siteUrl', sUrl)
        oGui.addDir(SITE_IDENTIFIER, 'showMovies', sTitle, 'doc.png', oOutputParameterHandler)

    oGui.setEndOfDirectory()

def showSearch():
    oGui = cGui()

    sSearchText = oGui.showKeyBoard()
    if (sSearchText != False):
            sUrl = 'http://www.topbestsite.com'+sSearchText
            showMovies(sUrl)
            oGui.setEndOfDirectory()
            return


def showMovies(sSearch = ''):
    oGui = cGui()
    if sSearch:
      sUrl = sSearch
    else:
        oInputParameterHandler = cInputParameterHandler()
        sUrl = oInputParameterHandler.getValue('siteUrl')

    oRequestHandler = cRequestHandler(sUrl)
    sHtmlContent = oRequestHandler.request();
    #sHtmlContent = sHtmlContent.replace(' target="_blank"', "");
    #sPattern = '<h2 class="wsite-content-title" style="text-align:left;"><font size="5"><a href="(.+?)">(.+?)<'
    sPattern = '<a href="(.+?)">(.+?)<'    
    oParser = cParser()
    aResult = oParser.parse(sHtmlContent, sPattern)
    #print aResult
    if (aResult[0] == True):
        total = len(aResult[1])
        dialog = cConfig().createDialog(SITE_NAME)
        for aEntry in aResult[1]:
            cConfig().updateDialog(dialog, total)
            if dialog.iscanceled():
                break

            sTitle = aEntry[1]
            #print sTitle
            #sTitle = (aEntry[1].replace('&gt;&gt;','')).replace('*&nbsp;','')
            oOutputParameterHandler = cOutputParameterHandler()
            oOutputParameterHandler.addParameter('siteUrl', str(aEntry[0]))
            oOutputParameterHandler.addParameter('sMovieTitle', str(sTitle))
            #oOutputParameterHandler.addParameter('sThumbnail', str(aEntry[2]))
            oGui.addMisc(SITE_IDENTIFIER, 'showHosters', sTitle, '', '', '', oOutputParameterHandler)

        cConfig().finishDialog(dialog)

        #sNextPage = __checkForNextPage(sHtmlContent)
        #if (sNextPage != False):
            #oOutputParameterHandler = cOutputParameterHandler()
            #oOutputParameterHandler.addParameter('siteUrl', sNextPage)
            #oGui.addDir(SITE_IDENTIFIER, 'showMovies', '[COLOR teal]Next >>>[/COLOR]', 'next.png', oOutputParameterHandler)

    if not sSearch:
        oGui.setEndOfDirectory()


def __checkForNextPage(sHtmlContent):
    #sPattern = '<span class="current">.+?</span><a href="(.+?)" title=\'.+?\'>.+?</a>'
    sPattern = 'src="(.+?)"'
    #sPattern = '<a href="(.+?)">(.+?)<'
    oParser = cParser()
    aResult = oParser.parse(sHtmlContent, sPattern)
    if (aResult[0] == True):
        return URL_MAIN+aResult[1][0]

    return False


def showHosters():
    oGui = cGui()
    oInputParameterHandler = cInputParameterHandler()
    sUrl = oInputParameterHandler.getValue('siteUrl')
    sMovieTitle = oInputParameterHandler.getValue('sMovieTitle')
    sThumbnail = oInputParameterHandler.getValue('sThumbnail')
    #print (sUrl)
    oRequestHandler = cRequestHandler(sUrl)
    sHtmlContent = oRequestHandler.request();
    #sHtmlContent = sHtmlContent.replace('</p>\n<iframe', '</p><iframe');
    #sHtmlContent = sHtmlContent.replace('<strong>', '');
    #sHtmlContent = sHtmlContent.replace('</strong>', '');
    #sPattern = 'file: "(.+?)", label: "(.+?)"'
    
    #sPattern = '<p><strong>(.+?)</strong></p><iframe src="(.+?)"'
    #sPattern = '(.+?)<iframe src="(.+?)"></iframe>'   
    #sPattern = '<a href="(.+?)">(.+?)<'       
    #sPattern = '(.+?)>(.+?)<'       
    sPattern = '<p>(.+?)</p><iframe.+?src="(.+?)"'       
    oParser = cParser()
    aResult = oParser.parse(sHtmlContent, sPattern)

    #print aResult
    if (aResult[0] == True):
        total = len(aResult[1])
        dialog = cConfig().createDialog(SITE_NAME)
        for aEntry in aResult[1]:
            cConfig().updateDialog(dialog, total)
            if dialog.iscanceled():
                break

            sHosterUrl = aEntry[1]
            #print sHosterUrl
            #sHosterUrl = str(aEntry[0])
            sTitle = aEntry[0]
            #sTitle = sMovieTitle+' | '+aEntry[1]
            #print sTitle
            oHoster = cHosterGui().checkHoster(sHosterUrl)
            if (oHoster != False):
                oHoster.setDisplayName(sTitle)
                oHoster.setFileName(sMovieTitle)
                cHosterGui().showHoster(oGui, oHoster, sHosterUrl, sThumbnail)

        cConfig().finishDialog(dialog)

    oGui.setEndOfDirectory()
