module ArticlesHelper
# article_params gets used in our articles_controller, allowing us to pass the
# full hash, but only permits the title and body params to be used, avoiding
# error
  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

end
