import { Component, OnInit } from '@angular/core';
import { OrderMngService } from 'src/app/services/order-mng/order-mng.service';

@Component({
  selector: 'app-orfer-mng',
  templateUrl: './orfer-mng.component.html',
  styleUrls: ['./orfer-mng.component.scss']
})
export class OrferMngComponent implements OnInit {
  lstOrder:any =[];
  constructor(
    private orderService: OrderMngService
  ) { }

  ngOnInit(): void {
    this.getData();
  }

  getData(){
    this.orderService.getAllOrder().subscribe(res=>{
      console.log(res);
      this.lstOrder = res.data

    })
  }

}
