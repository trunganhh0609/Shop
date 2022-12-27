import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { PromotionMngService } from 'src/app/services/promotion/promotion-mng.service';

@Component({
  selector: 'app-promotion-form',
  templateUrl: './promotion-form.component.html',
  styleUrls: ['./promotion-form.component.scss']
})
export class PromotionFormComponent implements OnInit {
  promotionData:any = {};
  submitted:boolean = false;
  lstType: any = [];
  startDate:Date;
  endDate:Date;
  constructor(
    private dialogRef: MatDialogRef<PromotionFormComponent>,
    private promotionService: PromotionMngService,
    @Inject(MAT_DIALOG_DATA) public data
  ) { }

  ngOnInit(): void {
    console.log(this.data);
    this.getLstType();

    if(this.data){
      this.startDate = new Date(this.data.START_DATE);
      this.endDate = new Date(this.data.END_DATE);
      this.promotionData.promotionName = this.data.PROMOTION_NAME;
      this.promotionData.promotionKey = this.data.PROMOTION_KEY;
      this.promotionData.promotionId = this.data.PROMOTION_ID;
      this.promotionData.value = this.data.VALUE;
      this.promotionData.promotionType = this.data.TYPE
    }
  }

  submit(){
    this.submitted = true;
    this.promotionData.startDate = this.format(new Date(this.startDate));
    this.promotionData.endDate = this.format(new Date(this.endDate));
    console.log(this.promotionData);

    this.promotionService.save(this.promotionData).subscribe(res=>{
      console.log(res);
      this.dialogRef.close(res)
    })
  }

  getLstType(){
    this.promotionService.getLstType().subscribe(res=>{
      this.lstType = res.data
    })
  }
  close(){
    this.dialogRef.close();
  }
  format(inputDate: Date) {
    let date, month, year;

    date = inputDate.getDate();
    month = inputDate.getMonth() + 1;
    year = inputDate.getFullYear();

      date = date
          .toString()
          .padStart(2, '0');

      month = month
          .toString()
          .padStart(2, '0');

    return `${year}/${month}/${date}`;
  }
}
