import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { environment } from '../../../../../src/environments/environment';

@Component({
    selector: 'app-blog-category-page',
    templateUrl: './blog-category-page.component.html',
    styleUrls: ['./blog-category-page.component.scss']
})
export class BlogCategoryPageComponent implements OnInit {

    public slug: any;
    public blogCategoryData : any;
    private API_URL= environment.API_URL;

    constructor(private route: ActivatedRoute, private http:HttpClient ) {
        this.route.params.subscribe((param : any)=>{
            let url = `${this.API_URL}/categories?filters[slug][$eq]=${param.slug}&populate=blog_posts.image`;
            let ddd = this.http.get(url);
            ddd.subscribe(res => {
                this.blogCategoryData = res;
            });
        });
    }

    ngOnInit(): void {}

    currentPage : any;
    onPageChange(page: number) {
        this.currentPage = page;
        window.scrollTo(0, 0);
    }

}