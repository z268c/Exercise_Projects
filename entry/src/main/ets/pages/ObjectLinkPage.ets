
//主组件
@Entry
@Component
struct ObjectLinkPage {

  @State b:ClassB = new ClassB(new ClassA(20), 5)

  build() {
    Column() {
      SubComp({b: this.b.a})

      Button('修改儿子').onClick(()=>{
          try{

          this.b.a.c = 30

          }catch(err){
              AlertDialog.show({message:JSON.stringify(err)})
          }
      })

    }
    .height('100%')
    .width('100%')
  }
}

//子组件
@Component
struct SubComp {

  // @ObjectLink b:ClassB
   @ObjectLink b:ClassA

  build() {

    Column(){

      // Text(this.b.b +'')
      Text(this.b.c +'')
    }




  }
}


@Observed
class ClassA {
  public c: number;

  constructor(c: number) {
    this.c = c;
  }
}


class ClassB {

  public a: ClassA;
  
  public b: number;

  constructor(a: ClassA, b: number) {
    this.a = a;
    this.b = b;
  }
}