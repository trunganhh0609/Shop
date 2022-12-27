import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MessageService } from 'primeng/api';
import { CategoryService } from 'src/app/services/category/category.service';
import Swal from 'sweetalert2';
import { CategoryFormComponent } from './category-form/category-form.component';

@Component({
  selector: 'app-category-mng',
  templateUrl: './category-mng.component.html',
  styleUrls: ['./category-mng.component.scss']
})
export class CategoryMngComponent implements OnInit {
  keySearch: string = '';
  lstCategory: any = [];
  constructor(
    private categoryService: CategoryService,
    private dialog: MatDialog,
    private messageService: MessageService,

  ) { }

  ngOnInit(): void {
    this.getData()
  }

  getData(){
    const param = { keySearch: this.keySearch }
    this.categoryService.searchCategory(param).subscribe(result => {
      console.log(result);
      this.lstCategory = result.data
    })
  }

  addCategory(){
    this.dialog.open(CategoryFormComponent,{
      width: "700px"
    }).afterClosed().subscribe(result => {
      if(result.success){
        this.showSuccess("Thêm danh mục thành công!!")
        this.getData()
      }else{
        this.showError("Thêm danh mục thất bại!!")
      }
    })
  }

  edit(item: any) {
    this.dialog.open(CategoryFormComponent,{
      width: "700px",
      data: item
    }).afterClosed().subscribe(result => {
      if(result.success){
        this.showSuccess("Cập nhật danh mục thành công!!")
        this.getData()
      }else{
        this.showError("Cập nhật danh mục thất bại!!")
      }
    })
  }

  delete(item:any){
    Swal.fire({
      title: 'Xóa danh mục?',
      text: "Bạn có chắc chắn muốn xóa?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        this.categoryService.delete(item).subscribe(res =>{
          if(res.success){
            this.showSuccess("Xóa danh mục thành công")
            this.getData()
          }else{this.showError("Xóa danh mục thất bại")}
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
