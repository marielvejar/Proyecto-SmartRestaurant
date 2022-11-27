import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { CommentComponent } from './comment/comment.component';
import { CommentFormComponent } from './commentForm/commentForm.component';
import { CommentsComponent } from './comments.component';
import { CommentsService } from './services/comments.service';

@NgModule({
  imports: [CommonModule, ReactiveFormsModule],
  declarations: [CommentsComponent, CommentComponent, CommentFormComponent],
  providers: [CommentsService],
  exports: [CommentsComponent],
})
export class CommentsModule {}