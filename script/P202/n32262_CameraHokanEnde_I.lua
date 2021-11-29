-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 523.197021 , 136.714554 , 8.510723 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 526.241638 , 137.750092 , 8.540723 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 528.586792 , 138.547729 , 8.550723 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 531.189758 , 139.433060 , 8.490723 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 533.860107 , 140.341324 , 8.580723 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
