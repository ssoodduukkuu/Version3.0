//
//  RetroFilter.cpp
//  CV__RetroEffect
//
//  Created by Dun on 16/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#include "RetroFilter.h"
#include <opencv2/imgproc/imgproc.hpp>

using namespace cv;

void alphaBlend(Mat src,Mat dst,Mat alpha)
{
    for (int i=0; i<src.rows; i++) {
        for (int j=0; j<src.cols; j++) {
            uchar alpha_value=alpha.at<uchar>(i,j);
            if (alpha_value != 0) {
                float text_weight=static_cast<float>(alpha_value)/255.0f;
                dst.at<uchar>(i,j)=text_weight*src.at<uchar>(i,j)+(1-text_weight)*dst.at<uchar>(i,j);
            }
        }
    }
}

RetroFilter::RetroFilter(const Parameters& params): rng_(time(0))
{
    params_=params;
    
    multiplier_=1.0;
    borderColor_.create(params_.frameSize, CV_8UC1);
    scratchColor_.create(params_.frameSize, CV_8UC1);
    
    sepiaH_.create(params_.frameSize, CV_8UC1);
    sepiaH_.setTo(Scalar(19));
    sepiaS_.create(params_.frameSize, CV_8UC1);
    sepiaS_.setTo(Scalar(78));
    sepiaPlanes_.resize(3);
    sepiaPlanes_[0]=sepiaH_;
    sepiaPlanes_[1]=sepiaS_;
    
    resize(params_.fuzzyBorder, params_.fuzzyBorder, params_.frameSize);
    
    if (params_.scratches.rows<params_.frameSize.height || params_.scratches.cols<params_.frameSize.width) {
        resize(params_.scratches, params_.scratches, params_.frameSize);
    }
}

void RetroFilter::applyToPhoto(const cv::Mat& frame, cv::Mat& retroFrame)
{
    Mat luminance;
    cvtColor(frame, luminance, CV_BGR2GRAY);
    
    //add scratches
    Scalar meanColor=cv::mean(luminance.row(luminance.rows/2));
    scratchColor_.setTo(meanColor*2.0);
    int x=rng_.uniform(0, params_.scratches.cols-luminance.cols);
    int y=rng_.uniform(0, params_.scratches.rows-luminance.rows);
    cv::Rect roi(cv::Point(x,y),luminance.size());
    scratchColor_.copyTo(luminance, params_.scratches(roi));
    
    //Add fuzzy border
    borderColor_.setTo(meanColor * 1.5);
    alphaBlend(borderColor_, luminance, params_.fuzzyBorder);
    
    //apply sepia-effect
    sepiaPlanes_[2]=luminance+20;
    Mat hsvFrame;
    merge(sepiaPlanes_, hsvFrame);
    cvtColor(hsvFrame, retroFrame, CV_HSV2BGR);
}

void RetroFilter::applyToVideo(const cv::Mat& inputFrame, cv::Mat& retroFrame)
{
    // Convert to gray with random shift
    cv::Size shift;
    shift.width = 2 + (rng_.uniform(0,10)?0:rng_.uniform(-1, 2));
    shift.height = 2 + (rng_.uniform(0, 10)?0:rng_.uniform(-1, 2));
    cv::Rect roiSrc(cv::Point(0,0),inputFrame.size()-shift);
    cv::Rect roiDst(shift, inputFrame.size()-shift);
    retroFrame.create(inputFrame.size(), CV_8UC1);
    cv::cvtColor(inputFrame(roiSrc), retroFrame(roiDst), CV_BGR2GRAY);
    
    //Add intensity variation
    float sign=pow(-1.f,rng_.uniform(0, 2));
    float value=1.f+sign*rng_.gaussian(0.2);
    multiplier_=0.7*multiplier_+0.3*value;
    retroFrame*=multiplier_;
    
    cv::Scalar meanColor=cv::mean(retroFrame.row(retroFrame.rows/2));
    
    //add scratches
    int x=rng_.uniform(0, params_.scratches.cols-retroFrame.cols);
    int y=rng_.uniform(0, params_.scratches.rows-retroFrame.rows);
    cv::Rect roi(cv::Point(x,y),retroFrame.size());
    if (rng_.uniform(0, 2)) {
        scratchColor_.setTo(meanColor*2);
    }
    else
    {
        scratchColor_.setTo(meanColor/2.0);
    }
    alphaBlend(scratchColor_, retroFrame, params_.scratches(roi));
    
    //add fuzzy border
    borderColor_.setTo(meanColor * 1.5);
    alphaBlend(borderColor_, retroFrame, params_.fuzzyBorder);
    
    //convert back to 3-channel image
    cv::cvtColor(retroFrame, retroFrame, CV_GRAY2BGR);
    
}


