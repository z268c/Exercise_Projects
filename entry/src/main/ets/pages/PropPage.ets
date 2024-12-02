@Entry
@Component
struct PropPage {
  @State money: number = 999999;

  build() {
    Column() {
      Text('father:' + this.money)
      Button('存100块').onClick(()=>{
        this.money = 200
      })
      //子组件
      CompQsChild({money: this.money})
    }
    .padding(20)
    .width('100%')
    .height('100%')
  }
}

@Component
struct CompQsChild {
  @Prop money: number = 0

  build() {
    Column() {
      Text('child:' + this.money)
      Button('花100块').onClick(()=>{
        this.money -= 80
      })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}