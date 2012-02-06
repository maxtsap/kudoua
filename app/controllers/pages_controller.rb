class PagesController < ApplicationController

  before_filter :find_page
  before_filter :find_published_news_items, :only => [:home]
  #before_filter :find_news_item, :find_latest_news_items, :only => [:show]


  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
    @banners = defined? Banner ? Banner.all : nil
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show
    @page = Page.find("#{params[:path]}/#{params[:id]}".split('/').last)

    if @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').live.first).present?
        redirect_to first_live_child.url and return
      elsif @page.link_url.present?
        redirect_to @page.link_url and return
      end
    else
      error_404
    end
  end

  protected

    def find_latest_news_items
      @news_items = NewsItem.latest.translated
    end

    def find_published_news_items
      @news_items = NewsItem.published.translated.paginate(:page => params[:page],
                                                :per_page => NewsItem.per_page)
    end

    def find_news_item
      @news_item = NewsItem.published.translated.find(params[:id])
    end

    def find_page
      @page = Page.find_by_link_url("/news")
    end

end
