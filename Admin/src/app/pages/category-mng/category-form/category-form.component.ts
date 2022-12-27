import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MessageService } from 'primeng/api';
import { CategoryService } from 'src/app/services/category/category.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-category-form',
  templateUrl: './category-form.component.html',
  styleUrls: ['./category-form.component.scss']
})
export class CategoryFormComponent implements OnInit {
  categoryData: any = {};
  submitted: boolean = false;
  constructor(
    private dialogRef: MatDialogRef<CategoryFormComponent>,
    @Inject(MAT_DIALOG_DATA) public data,
    private messageService: MessageService,
    private categoryService: CategoryService
  ) { }

  ngOnInit(): void {
    if(this.data){
      this.categoryData = this.data
    }
  }

  submit(invalid: boolean){
    if(!invalid){
      this.categoryService.save(this.categoryData).subscribe(res=>{
        this.dialogRef.close(res)
      })
    }

  }

  closePopup(){
    this.dialogRef.close()
  }
}
