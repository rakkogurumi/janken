$ ->
  app.setup()
  app.setBind()


flag = undefined
mylife = undefined
enemylife = undefined
myhand = undefined

window.app =

  setup: ->
    flag = -1
    $( '#AnimeOutput' ).text( 'じゃんけんゲーム' )
    $( '#Output' ).text( 'スタートをおしてね' )
    @changeLife(3,0)
    @changeLife(3,1)

  setBind: ->

    $('#start').bind 'click', =>
      if flag is -1
        mylife = 3
        @changeLife(mylife,0)
        enemylife = 3
        @changeLife(enemylife,1)
        $(".handBox").html ''
        $( '.window' ).text(' ')
        $( '#Output' ).text( 'スタート' )
        $( '#AnimeOutput' ).html( """<p class="movetxt">じゃんけんぽん</p>""" )
        @textAnime('.movetxt')
        @flagChange(1)

    $('#replay').bind 'click', =>
      if flag is 0
        $( '#Output' ).text( 'もう１回' )
        $(".handBox").html ''
        $( '#AnimeOutput' ).html( """<p class="movetxt">じゃんけんぽん</p>""" )
        @textAnime('.movetxt')
        @flagChange(1)

    $('#gu').bind 'click', =>
        @printMyHand(0)
    $('#choki').bind 'click', =>
        @printMyHand(1)
    $('#pa').bind 'click', =>
        @printMyHand(2)





  game:(myhand) =>
    enemyhand = _.random(2)
    app.printHand(enemyhand,1)

    check = enemyhand - myhand
    if check < 0
      check += 3

    if check is 0
      flag=2
      $( '#Output' ) . text( '引き分け' )
      $( '#AnimeOutput' ).html( """<p class="movetxt">あいこでしょ</p>""" )
      app.textAnime('.movetxt')
      app.flagChange(1)
    else if check is 1
      $( '#Output' ) . text( '勝ち' )
      enemylife--
      app.changeLife(enemylife,1)
      flag = 0
    else
      $( '#Output' ) . text( '負け' )
      mylife--
      app.changeLife(mylife,0)
      flag = 0
    if not (mylife and enemylife)
        $( '#AnimeOutput' ).text( 'スタートをおすともう１回できるよ！' )
        flag = -1
      if mylife is 0
        $( '#LifeOutput' ) . text( 'ライフポイント0であなたの負け' )
      else if enemylife is 0
        $( '#LifeOutput' ) . text( '相手が倒れました！あなたの勝ち' )

  changeLife:(life,code) =>
    html = ''
    _.each [1..3], (i)->
      if life - i >= 0
        image_type = 'on'
      else
        image_type = 'off'
      if code is 0
        id_type = 'my'
      else
        id_type = 'enemy'
      html += """<img src="image/redheart_#{image_type}.png" id="#{id_type}Life#{i}" class="#{id_type}Life" alt="" width="70"/>"""
      $("##{id_type}LifeBox").html html

  printHand:(hand,code) =>
    html = ''
    if hand is 0
      image_type = 'gu'
    else if hand is 1
      image_type = 'choki'
    else
      image_type = 'pa'
    if code is 0
      id_type = 'my'
    else
      id_type = 'enemy'
    html += """<img src="image/#{image_type}.jpg" id="box#{id_type}hand" class="#{id_type}hand" alt="" width="150"/>"""
    $("##{id_type}handBox").html html


  printMyHand:(hand) =>
    if flag is 1
      myhand=hand
      app.printHand(myhand,0)
      $( '#AnimeOutput' ).text( 'もう１回 する？' )
      app.game(myhand)



  textAnime:(pos)->
    $(pos).textillate
      loop: false
      minDisplayTime: 2000
      initialDelay: 0
      autoStart: true
      in:
        effect: 'BounceInDown'
        delayScale: 1.5
        delay: 50
        sync: false
        shuffle: false

  flagChange:(fg)->
    setTimeout ->
        flag=fg
      ,1500

