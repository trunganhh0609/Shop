import { Component, OnInit } from '@angular/core';
import { OwlOptions } from 'ngx-owl-carousel-o';
@Component({
  selector: 'app-homethree-banner',
  templateUrl: './homethree-banner.component.html',
  styleUrls: ['./homethree-banner.component.scss']
})
export class HomethreeBannerComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {

  }
  feedbackSlides: OwlOptions = {
    items: 1,
    // nav: true,
    loop: true,
    margin: 25,
    dots: true,
    autoplay: true,
    smartSpeed: 500,
    autoplayHoverPause: false,
    navText: [
        "<i class='ri-arrow-left-s-line'></i>",
        "<i class='ri-arrow-right-s-line'></i>"
    ]
}

}
