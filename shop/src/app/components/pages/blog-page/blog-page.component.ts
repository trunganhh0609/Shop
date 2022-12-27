import { Component, OnInit } from '@angular/core';
import { BlogService } from '../../common/blog/blog.service';

@Component({
    selector: 'app-blog-page',
    templateUrl: './blog-page.component.html',
    styleUrls: ['./blog-page.component.scss']
})
export class BlogPageComponent implements OnInit {

    public blogPostsData: any;

	constructor(
        private content: BlogService
	) {
		this.content.getData().subscribe((blogPostsData: any) => {
            this.blogPostsData = blogPostsData.data;
        });
	}

    ngOnInit(): void {}

    currentPage : any;
    onPageChange(page: number) {
        this.currentPage = page;
        window.scrollTo(0, 0);
    }

}