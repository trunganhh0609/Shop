import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ProductMngService } from 'src/app/services/product-mng/product-mng.service';

@Component({
  selector: 'app-product-mng-form',
  templateUrl: './product-mng-form.component.html',
  styleUrls: ['./product-mng-form.component.scss']
})
export class ProductMngFormComponent implements OnInit {
  submitted:boolean = false;
  productData:any = {};
  lstPromotion:any = [];
  lstCategory:any = [];
  constructor(
    private dialogRef: MatDialogRef<ProductMngFormComponent>,
    private productService: ProductMngService,
    @Inject(MAT_DIALOG_DATA) public data
  ) { }

  ngOnInit(): void {
    if(this.data){
      this.productData['productId'] = this.data.PRODUCT_ID;
      this.productData['productName'] = this.data.PRODUCT_NAME;
      this.productData['price'] = this.data.PRICE;
      this.productData['imagePath'] = this.data.IMAGE;
      this.productData['promotionId'] = this.data.PROMOTION_ID;
      this.productData['categoryId'] = this.data.CATEGORY_ID;
      this.productData['quantity'] = this.data.QUANTITY;
      this.productData['description'] = this.data.DESCRIPTION;
    }else{
      this.productData['categoryId'] = ''
      this.productData['promotionId'] = ''
    }
    this.getDataProductMngForm()
  }

  getDataProductMngForm(){
    this.productService.getDataProductMngForm().subscribe(res => {
      console.log(res)
      this.lstCategory = res.lstCategory
      this.lstPromotion = res.lstPromotion
    })
  }

  async saveImg(file:any) {
    let formData = new FormData();
    let path = ''
    formData.append("image", file);
    await this.productService.uploadImage(formData).toPromise().then(result => {
      path = result.path;
      console.log(path);
    });
    return path;
  }

  async submit(){

    if(this.productData["image"]){
      this.productData["image"] = await this.saveImg(this.productData["image"]);
    }
    console.log(this.productData);
    if(!this.data){


      this.productService.saveProduct(this.productData).subscribe(res => {
            console.log(res);
            this.dialogRef.close(res);
      })
    }else{
      this.productService.editProduct(this.productData).subscribe(res => {
        console.log(res);
        this.dialogRef.close(res);
  })
    }

  }
  closePopup(){
    this.dialogRef.close();
  }

  onSelectImg(event:any){
    this.productData['image'] = event.target.files[0];
  }
}
