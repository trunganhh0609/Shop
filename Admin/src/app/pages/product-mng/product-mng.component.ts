import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DomSanitizer } from '@angular/platform-browser';
import { MessageService } from 'primeng/api';
import { ProductMngService } from 'src/app/services/product-mng/product-mng.service';
import { environment } from 'src/environments/environment';
import Swal from 'sweetalert2';
import { ProductMngFormComponent } from './product-mng-form/product-mng-form.component';

@Component({
  selector: 'app-product-mng',
  templateUrl: './product-mng.component.html',
  styleUrls: ['./product-mng.component.scss']
})
export class ProductMngComponent implements OnInit {
  lstProduct: any = [];
  lstCategory = [];
  searchRequest: any = {}
  constructor(
    private dialog: MatDialog,
    private messageService: MessageService,
    private productService: ProductMngService,
    private sanitizer: DomSanitizer
  ) { }

  ngOnInit(): void {
    this.searchRequest['keySearch'] = '';
    this.searchRequest['categoryId'] = '';
    this.getData();
    this.getListCategory();
  }

  getData(){
    this.productService.getProductMng(this.searchRequest).subscribe(result => {
      this.lstProduct = result.data
      this.lstProduct.forEach(product =>{
        product.IMAGE = environment.mainURL + "/view/img-view/" + product.IMAGE;
      })
    })
  }

  getListCategory(){
    this.productService.getDataProductMngForm().subscribe(res => {
      this.lstCategory = res.lstCategory
    })
  }

  addProduct(){
    this.dialog.open(ProductMngFormComponent,{
      width: '700px'
      ,height: '600px'
    }).afterClosed().subscribe(result => {
      if(result.success) {
        this.showSuccess("Thêm sản phẩm thành công!!")
        this.getData()
      }else{
        this.showError("Thêm sản phẩm thất bại!")
      }
    })
  }
  edit(item:any){
    this.dialog.open(ProductMngFormComponent, {
      width: "700px",
      height: "600px",
      data: item
    }).afterClosed().subscribe(result => {
      if(result.success) {
        this.showSuccess("Cập nhật sản phẩm thành công!!")
        this.getData()
      }else{
        this.showError("Cập nhật sản phẩm thất bại!")
      }
    })
  }
  delete(item:any){
    Swal.fire({
      title: 'Xóa sản phẩm?',
      text: "Bạn có chắc chắn muốn xóa?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        this.productService.deleteProduct({productId:item.PRODUCT_ID}).subscribe(res =>{
          if(res.success){
            this.showSuccess("Xóa sản phẩm thành công")
            this.getData()
          }else{this.showError("Xóa sản phẩm thất bại")}
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
