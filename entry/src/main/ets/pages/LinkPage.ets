@Entry
@Component
struct LinkPage {
  @State money: number = 100;

  build() {
    Column() {
      Text('father:' + this.money)
      Button('存100块').onClick(()=>{
        this.money += 10
      })
      //子组件
      LinkQsChild({money: this.money})
    }
    .padding(20)
    .width('100%')
    .height('100%')
  }
}

@Component
struct LinkQsChild {
  @Link money: number

  build() {
    Column() {
      Text('child:' + this.money)


      Button('花100块').onClick(()=>{
        this.money -= 80
      })

      SubLinkQsChild({money: this.money})
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}


@Component
struct SubLinkQsChild {
  @Link money: number

  build() {
    Column() {
      Text('child:' + this.money)
      Button('花100块').onClick(()=>{
        this.money -= 20
      })
    }
    .padding(20)
    .backgroundColor(Color.Yellow)
  }
}

