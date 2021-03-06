" Vim syntax file

" mason.vim - vim syntax file for Mason (Perl embedded in HTML)
" Andrew Smith, andrewdsmith@yahoo.com, Jul 00
" http://www.cs.indiana.edu/~kinzler/home.html#vi

" Language:    Mason (Perl embedded in HTML)
" Maintainer:  Andrew Smith <andrewdsmith@yahoo.com>
" Last change: 2000 Jul 10
" URL:         http://www.masonhq.com/editors/mason.vim
"
" This seems to work satisfactorily with html.vim and perl.vim for version 5.5.
" Please mail any fixes or improvements to the above address. Things that need
" doing include:
"
"  - Add match for component names in <& &> blocks.
"  - Add match for component names in <%def> and <%method> block delimiters.
"  - Fix <%text> blocks to show HTML tags but ignore Mason tags.
"
syn clear

if !exists("main_syntax")
  let main_syntax = 'mason'
endif

"so <sfile>:p:h/html.vim
" $VIMRUNTIME doesn't work here in older vim's, even if set in .vimrc
" but just $VIM doesn't work in newer vim's
so $VIMRUNTIME/syntax/html.vim
syn cluster htmlPreproc add=@masonTop

"syn include @perlTop <sfile>:p:h/perl.vim
" $VIMRUNTIME doesn't work here in older vim's, even if set in .vimrc
" but just $VIM doesn't work in newer vim's
syn include @perlTop $VIMRUNTIME/syntax/perl.vim

" It's hard to reduce down to the correct sub-set of Perl to highlight in some
" of these cases so I've taken the safe option of just using perlTop in all of
" them. If you have any suggestions, please let me know.
"
syn region masonLine matchgroup=Delimiter start="^%" end="$" contains=@perlTop
syn region masonExpr matchgroup=Delimiter start="<%" end="%>" contains=@perlTop
syn region masonPerl matchgroup=Delimiter start="<%perl>" end="</%perl>" contains=@perlTop
syn region masonComp keepend matchgroup=Delimiter start="<&" end="&>" contains=@perlTop

syn region masonArgs matchgroup=Delimiter start="<%args>" end="</%args>" contains=@perlTop

syn region masonInit matchgroup=Delimiter start="<%init>" end="</%init>" contains=@perlTop
syn region masonCleanup matchgroup=Delimiter start="<%cleanup>" end="</%cleanup>" contains=@perlTop
syn region masonOnce matchgroup=Delimiter start="<%once>" end="</%once>" contains=@perlTop
syn region masonShared matchgroup=Delimiter start="<%shared>" end="</%shared>" contains=@perlTop

syn region masonDef matchgroup=Delimiter start="<%def[^>]*>" end="</%def>" contains=@htmlTop
syn region masonMethod matchgroup=Delimiter start="<%method[^>]*>" end="</%method>" contains=@htmlTop

syn region masonFlags matchgroup=Delimiter start="<%flags>" end="</%flags>" contains=@perlTop
syn region masonAttr matchgroup=Delimiter start="<%attr>" end="</%attr>" contains=@perlTop

syn region masonFilter matchgroup=Delimiter start="<%filter>" end="</%filter>" contains=@perlTop

syn region masonDoc matchgroup=Delimiter start="<%doc>" end="</%doc>"
syn region masonText matchgroup=Delimiter start="<%text>" end="</%text>"

syn cluster masonTop contains=masonLine,masonExpr,masonPerl,masonComp,masonArgs,masonInit,masonCleanup,masonOnce,masonShared,masonDef,masonMethod,masonFlags,masonAttr,masonFilter,masonDoc,masonText

hi link masonDoc Comment
