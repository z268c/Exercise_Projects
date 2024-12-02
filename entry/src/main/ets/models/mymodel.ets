
export interface GoodType{
  name: string
  price: number
  count: number
}

@Observed
export class GoodTypeModel implements GoodType{
  name: string
  price: number
  count: number

  constructor(name: string, price: number, count: number) {
    this.name = name
    this.price = price
    this.count = count
  }

}


export  interface IStudent{

  no: number
  name: string
  comp: Computer

}


export class Student implements  IStudent{
  no: number
  name: string
  comp: Computer

  constructor(no: number, name: string, comp: Computer) {
    this.no = no
    this.name = name
    this.comp = comp
  }

}


export  interface IComputer{
  brand: string
  price: number
}

@Observed
export class Computer implements IComputer{
  brand: string = ''
  price: number = 0

  constructor(brand: string, price: number) {
    this.brand = brand
    this.price = price
  }

}
