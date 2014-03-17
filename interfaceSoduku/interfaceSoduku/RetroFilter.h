//
//  RetroFilter.h
//  CV__RetroEffect
//
//  Created by Dun on 16/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#ifndef __CV__RetroEffect__RetroFilter__
#define __CV__RetroEffect__RetroFilter__

#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

class RetroFilter
{
public:
    struct Parameters
    {
        cv::Size frameSize;
        cv::Mat fuzzyBorder;
        cv::Mat scratches;
    };
    
    RetroFilter(const Parameters& params);
    virtual ~RetroFilter(){};
    void applyToPhoto(const cv::Mat& frame, cv::Mat& retroFrame);
    void applyToVideo(const cv::Mat& frame, cv::Mat& retroFrame);
    
protected:
    Parameters params_;
    
    cv::RNG rng_;
    float multiplier_;
    
    cv::Mat borderColor_;
    cv::Mat scratchColor_;
    
    std::vector<cv::Mat> sepiaPlanes_;
    cv::Mat sepiaH_;
    cv::Mat sepiaS_;
    
};

#endif /* defined(__CV__RetroEffect__RetroFilter__) */
