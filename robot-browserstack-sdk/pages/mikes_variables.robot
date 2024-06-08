*** Variables ***
${baseurl}=    https://www.mikeshard.com/
${msg}
${limonada-tab}=    xpath=//a[normalize-space()='LIMONADA']
${product-list} =             css:h6.more-flavor-image-title
@{list-products-user}    CITRUS LIMONADA    PINEAPPLE GUAVA    MANGONADA    WATERMELON LIME
${Flavour-tab}=    xpath= (//div[@id="navbarNav"]/div/ul/li/a)[1]
${navigation-menu}=    xpath= //div[@id="navbarNav"]/div/ul/li/a
${para-data}=     Discover Mike’s Limonada Fresca, a refreshing new twist on traditional Mexican Aguas Frescas recipes with a rush of lime and lemon flavors sourced from family-owned farms. We blend our luscious citrus with real juice and balance it with natural agave nectar. Surprisingly bright and bold Mike’s Limonada Fresca is a flavor breakthrough in our relentless quest to craft the World’s best tasting hard lemonades and a way to enjoy the lively zest of Mexican street cart drinks in your own home.
${managecookies-mike}        xpath=//button[@id='onetrust-pc-btn-handler']
${managechoices-mike}      css:button.onetrust-close-btn-handler
${hamburger}        css:div.hamburger