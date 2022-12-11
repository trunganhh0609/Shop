import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MessageService } from 'primeng/api';
import { PromotionMngService } from 'src/app/services/promotion/promotion-mng.service';
import Swal from 'sweetalert2';
import { PromotionFormComponent } from './promotion-form/promotion-form.component';

@Component({
  selector: 'app-promotion-mng',
  templateUrl: './promotion-mng.component.html',
  styleUrls: ['./promotion-mng.component.scss']
})
export class PromotionMngComponent implements OnInit {
  lstPromotion: any= [];
  constructor(
    private promotionService: PromotionMngService,
    private messageService: MessageService,
    private dialog: MatDialog
  ) { }

  ngOnInit(): void {
    this.getData();
  }

  getData(){
    this.promotionService.getAll().subscribe(res => {
      this.lstPromotion = res.lstPromotion
      console.log(res);

    })
  }
  add(){
    this.dialog.open(PromotionFormComponent,{
      width: '700px'
    }).afterClosed().subscribe(result => {
      if(result.success) {
        this.showSuccess("Thêm khuyến mại thành công!!")
        this.getData()
      }else{
        this.showError("Thêm khuyến mại thất bại!")
      }
    })
  }
  edit(item: any){
    this.dialog.open(PromotionFormComponent,{
      width: '700px',
      data: item
    }).afterClosed().subscribe(result => {
      if(result.success) {
        this.showSuccess("Cập nhật khuyến mại thành công!!")
        this.getData()
      }else{
        this.showError("Cập nhật khuyến mại thất bại!")
      }
    })
  }
  delete(item: any){
    Swal.fire({
      title: 'Xóa khuyến mại?',
      text: "Bạn có chắc chắn muốn xóa?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        this.promotionService.delete({promotionId:item.PROMOTION_ID}).subscribe(res =>{
          if(res.success){
            this.showSuccess("Xóa khuyến mại thành công")
            this.getData()
          }else{this.showError("Xóa khuyến mại thất bại")}
        })
      }
    })
  }

  showSuccess(message:any) {
    this.messageService.add({severity:'success', summary: 'Success', detail: message});
  }

  showError(message:any) {
    this.messageService.add({severity:'error', summary: 'Lỗi', detail: message});
  }
}
