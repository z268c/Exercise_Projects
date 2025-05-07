@Entry
@Component
struct ProvidAndConsumePage {

  @Provide money: number = 100;

  build() {
    Column() {
      Text('father:' + this.money)
      Button('存100块').onClick(()=>{
        this.money += 10
      })
      //子组件
      ProConsumQsChild()
    }
    .padding(20)
    .width('100%')
    .height('100%')
  }
}


@Component
struct ProConsumQsChild {
  @Consume('money') mymoney: number

  build() {
    Column() {
      Text('child:' + this.mymoney)
      Button('花100块').onClick(()=>{
        this.mymoney -= 20
      })

      ProQsChild2()
    }
    .padding(20)
    .backgroundColor(Color.Yellow)
  }
}



@Component
struct ProQsChild2 {
  @Consume money: number

  build() {
    Column() {
      Text('child:' + this.money)
      Button('花100块').onClick(()=>{
        this.money -= 20
      })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}
