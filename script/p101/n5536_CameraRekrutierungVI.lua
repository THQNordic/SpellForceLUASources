-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 411.179718 , 181.285049 , 14.519634 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(-2,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 410.725037 , 182.175690 , 14.519634 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 410.725037 , 182.175690 , 14.519634 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 410.725037 , 182.175690 , 14.519634 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
