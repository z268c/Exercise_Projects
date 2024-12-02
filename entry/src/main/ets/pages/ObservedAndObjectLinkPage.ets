import { Computer, Student } from '../models/mymodel'

@Entry
@Component
struct ObservedAndObjectLinkage {


  @State stu: Student = new Student(1,"A牛", new Computer('dell', 5000))

  build() {
    Row(){
      SubComponent({stu: this.stu, comp: this.stu.comp})
    }
  }
}

@Component
struct SubComponent {

  @Link stu: Student
  @ObjectLink comp: Computer

  build() {
    Column(){
      Text(this.stu.no+'')
      Text(this.stu.name+'')
      TextInput({text: $$this.stu.name})
      Text(this.comp.brand+'')
      TextInput({text: $$this.comp.brand})

      Button('测试修改').onClick(()=>{
        this.stu.no = 2
        this.stu.name = '啵啵啵'
        this.stu.comp.brand = '联想'
      })
    }
  }
}