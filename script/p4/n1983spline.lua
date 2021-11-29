-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 131.714890 , 631.501587 , 90.227280 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(191.396,586.445,48.887);
]] )
   Camera:MotionSpline_AddSplinePoint( 119.952255 , 610.201355 , 86.700760 , 2.200000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.0001);
Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 124.485512 , 584.767212 , 80.068283 , 3.999998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 147.547989 , 552.594177 , 71.418274 , 7.399995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 209.935104 , 519.506287 , 45.483467 , 9.299999 , [[Camera:ScriptSplineModifyCursorSpeed(0.6);]] )
   Camera:MotionSpline_AddSplinePoint( 236.699005 , 508.390198 , 39.304054 , 12.000010 , [[Camera:ScriptSplineModifyCursorSpeed(0.4);
]] )
   Camera:MotionSpline_AddSplinePoint( 260.654236 , 501.528381 , 37.450687 , 14.800020 , [[Camera:ScriptSplineModifyCursorSpeed(0.4);
Camera:ScriptSplineModifyCursorSpeedModifier(0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 285.162781 , 495.192200 , 40.242138 , 14.800020 , [[Camera:ScriptSplinePause(3);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 92.382813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
