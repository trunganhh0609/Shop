import { Component, OnInit } from '@angular/core';
import { BlogService } from './blog.service';

@Component({
    selector: 'app-blog',
    templateUrl: './blog.component.html',
    styleUrls: ['./blog.component.scss']
})
export class BlogComponent implements OnInit {

    public blogPostsData: any;

	constructor(
        private content: BlogService
	) {
		this.content.getData().subscribe((blogPostsData: any) => {
            this.blogPostsData = blogPostsData.data;
        });
	}

	ngOnInit(): void {}

}