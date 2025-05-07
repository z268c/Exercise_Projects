import { GoodTypeModel } from '../models/mymodel'

@Entry
@Component
struct ObservedObjectLinkPage {

  //定义商品的对象数组
  @State goodList: GoodTypeModel[] = [
    new GoodTypeModel('瓜子', 10, 2),
    new GoodTypeModel('花生', 15, 2),
    new GoodTypeModel('矿泉水', 4, 20),
  ]


  build() {
    Column(){
      List(){
        ForEach(this.goodList, (item: GoodTypeModel)=>{
          GoodItemLink({goodItem: item})
        })
      }

    }

  }
}

@Component
struct GoodItemLink {

  @ObjectLink goodItem: GoodTypeModel

  build() {
    Row({space: 20}){
      Text(this.goodItem.name).width(150)
      Text(this.goodItem.price+"").layoutWeight(1)
      Text(this.goodItem.count+'').onClick(()=>{
        this.goodItem.count--
      })
    }.width('100%').padding(20)
  }
}