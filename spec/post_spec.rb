require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Posts Validation' do
    before(:all) do
      @user = User.create(name: 'Esther Alice', postsCounter: 0)
      @user.save
    end

    subject do
      Post.create(title: 'Alice in wonderlands', text: 'Beware the Jabberwock, my son!', commentsCounter: 0,
                  likesCounter: 0, author_id: @user.id)
    end

    before { subject.save }

    context 'Title' do
      it 'title should be valid' do
        expect(subject).to be_valid
      end

      it 'title should be invalid if it is nil' do
        subject.title = nil
        expect(subject).to_not be_valid
      end

      it 'title should be invalid if it is larger than 250' do
        subject.title = 'a' * 251
        expect(subject).to_not be_valid
      end
    end

    context 'Comments' do
      it 'comment should be valid' do
        expect(subject).to be_valid
      end

      it 'comment should be invalid if it is string' do
        subject.commentsCounter = 'string'
        expect(subject).to_not be_valid
      end

      it 'comment should be invalid if it is negative number' do
        subject.commentsCounter = -5
        expect(subject).to_not be_valid
      end
    end

    context 'Likes' do
      it 'likes should be valid' do
        expect(subject).to be_valid
      end

      it 'like should be invalid if it is string' do
        subject.likesCounter = 'string'
        expect(subject).to_not be_valid
      end

      it 'like should be invalid if it is negative number' do
        subject.likesCounter = -1
        expect(subject).to_not be_valid
      end
    end

    context 'Likes Counter' do
      it 'likesCounter should be invalid if it is negative number' do
        subject.likesCounter = -1
        expect(subject).to_not be_valid
      end

      it 'likesCounter should be vaild if it is more than or equal 0' do
        expect(subject).to be_valid
      end
    end

    context 'Comments Counter' do
      it 'comments_counter should be invalid if it is negative number' do
        subject.commentsCounter = -1
        expect(subject).to_not be_valid
      end

      it 'comments_counter should be vaild if it is more than or equal 0' do
        expect(subject).to be_valid
      end
    end

    context 'Methods' do
      it 'return the last 5 comments' do
        (1..6).each do
          subject.comments.create(text: 'Hi')
        end
        expect(subject.most_recent_comments.count).to eq(5)
      end

      it 'update_posts_counter should be equal one' do
        expect(subject.author.postsCounter).to eq(2)
      end
    end
  end
end
