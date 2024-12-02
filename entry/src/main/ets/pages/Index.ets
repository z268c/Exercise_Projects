@Entry
@Component
struct Index {

  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      TextInput({text: $$this.message})

        Button('点我改变').onClick(()=>{
            this.message = 'ken'

        })

      Button('获取数据').onClick(()=>{
        console.log('ken',this.message)
      })



    }
    .height('100%')
    .width('100%')
  }
}