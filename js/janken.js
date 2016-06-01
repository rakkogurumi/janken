var startflag=-1;
var life_j, life_a;

function start(){
  if(startflag==-1){
    startflag=1;
    life_j=3;
    life_a=3;
    console.log('スタート！');
  }
}

function replay(){
  if(startflag==0){
    startflag=1;
    console.log("もう１回！");
  }
}

function game(jibun){
  if(startflag==1){
    //グー：１
    //チョキ：２
    //パー：３
    var aite =(Math.random())*0.9;
    if(aite<0.3){
      aite=1;
    }else if(aite<0.6){
      aite=2;
    }else{
      aite=3;
    }

    console.log('相手は'+aite);

    var check=0;
    check = aite - jibun;
    if(check < 0) check += 3;

    if(check==0) {
      console.log("引き分け");
      console.log("あいこでしょ！");
    }else if(check==1){
      console.log("勝ち");
      life_a--;
      console.log("自分：残り"+life_j+"、相手：残り"+life_a);
      startflag=0;
    }else{
      console.log("負け");
      life_j--;
      console.log("自分：残り"+life_j+"、相手：残り"+life_a);
      startflag=0;
    }
    if(life_j==0){
      console.log("ライフポイント０であなたの負け");
      startflag=-1;
    }else if(life_a==0){
      console.log("相手が倒れました！あなたの勝ち");
      startflag=-1;
    }
  }
}
i
