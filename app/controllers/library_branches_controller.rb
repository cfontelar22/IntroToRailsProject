class LibraryBranchesController < ApplicationController
    def show
      @library_branch = LibraryBranch.find(params[:id])
    end
  end
  